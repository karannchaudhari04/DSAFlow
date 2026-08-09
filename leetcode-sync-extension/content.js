// Throttle & Click flags
let syncThrottle = false;
let submitClicked = false;
let submitTimer = null;

// Listen to submit click events to enable observation validation window
document.addEventListener('click', (e) => {
  const target = e.target;
  const button = target.closest('button') || target.closest('[role="button"]');
  if (button) {
    const text = button.textContent || '';
    const isSubmitBtn = text.toLowerCase().includes('submit') || 
                        button.getAttribute('data-cy') === 'submit-code-btn' ||
                        button.className.includes('submit');
                        
    if (isSubmitBtn) {
      console.log("LeetCode Sync Pipeline: Submit clicked. Activating capture window.");
      submitClicked = true;
      if (submitTimer) clearTimeout(submitTimer);
      submitTimer = setTimeout(() => {
        submitClicked = false;
      }, 45000); // Allow up to 45 seconds for submission compilation and response
    }
  }
});

// Observe DOM updates to find "Accepted" submissions
function startObservation() {
  const observer = new MutationObserver(() => {
    // Only process check if user recently submitted code
    if (!submitClicked) return;

    // Check if the page contains the submission success success states
    // Modern LeetCode has text element containing "Accepted"
    const successElements = Array.from(document.querySelectorAll('*'))
      .filter(el => {
        const text = el.textContent || '';
        return text.trim() === 'Accepted' && el.children.length === 0;
      });

    if (successElements.length > 0 && !syncThrottle) {
      syncThrottle = true;
      submitClicked = false; // Reset flag immediately on capture
      if (submitTimer) clearTimeout(submitTimer);
      setTimeout(() => { syncThrottle = false; }, 5000); // Throttle for 5s
      
      console.log("LeetCode Sync Pipeline: Detected Accepted Submission!");
      triggerProblemSync();
    }
  });

  observer.observe(document.body, { childList: true, subtree: true });
}

function triggerProblemSync() {
  // Scrape problem title header
  let titleText = "";
  const titleEl = document.querySelector("div.text-title-large") || 
                  document.querySelector("span.text-title-large") ||
                  document.querySelector("h4");

  if (titleEl) {
    titleText = titleEl.textContent.trim();
  } else {
    // Fallback to page title
    titleText = document.title;
  }

  // Parse: "123. Problem Name"
  const match = titleText.match(/^(\d+)\.\s*(.*)$/);
  if (!match) {
    console.warn("LeetCode Sync Pipeline: Could not parse problem title:", titleText);
    return;
  }

  const leetcodeNumber = parseInt(match[1]);
  const name = match[2].replace(/\s*-\s*LeetCode\s*$/i, "").trim();
  const url = window.location.href.split("/description")[0].split("/submissions")[0].split("?")[0];

  // Detect difficulty
  let difficulty = "EASY";
  const bodyText = document.body.textContent || '';
  if (bodyText.includes("Medium")) {
    difficulty = "MEDIUM";
  } else if (bodyText.includes("Hard")) {
    difficulty = "HARD";
  }

  const payload = [{
    leetcodeNumber,
    name,
    url,
    difficulty
  }];

  console.log("LeetCode Sync Pipeline: Syncing problem metadata:", payload);

  fetch("https://dsaflow-kjkc.onrender.com/api/problems/sync", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(payload)
  })
  .then(res => {
    if (res.ok) {
      console.log("LeetCode Sync Pipeline: Successfully synced to tracker sheet!");
    } else {
      console.error("LeetCode Sync Pipeline: Sync failed with status:", res.status);
    }
  })
  .catch(err => {
    console.error("LeetCode Sync Pipeline: Sync request error:", err);
  });
}

// Start observation
if (document.readyState === 'complete' || document.readyState === 'interactive') {
  startObservation();
} else {
  document.addEventListener('DOMContentLoaded', startObservation);
}
