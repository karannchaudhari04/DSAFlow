document.getElementById("sync-history-btn").addEventListener("click", async () => {
  const btn = document.getElementById("sync-history-btn");
  const statusBox = document.getElementById("status-box");

  btn.disabled = true;
  btn.textContent = "Fetching from LeetCode...";
  statusBox.style.display = "block";
  statusBox.className = "status-container";
  statusBox.textContent = "Connecting to LeetCode session...";

  try {
    // Fetch all problems from LeetCode's session
    const response = await fetch("https://leetcode.com/api/problems/all/");
    if (!response.ok) {
      throw new Error("Could not reach LeetCode. Please verify you are logged in at leetcode.com.");
    }

    const data = await response.json();
    if (!data.stat_status_pairs) {
      throw new Error("Unexpected response format. Please log in to LeetCode and try again.");
    }

    // Filter questions marked as "ac" (Accepted/Solved)
    const solvedQuestions = data.stat_status_pairs
      .filter(q => q.status === "ac")
      .map(q => {
        let diff = "EASY";
        if (q.difficulty.level === 2) diff = "MEDIUM";
        if (q.difficulty.level === 3) diff = "HARD";

        return {
          leetcodeNumber: q.stat.question_id,
          name: q.stat.question__title,
          url: `https://leetcode.com/problems/${q.stat.question__title_slug}/`,
          difficulty: diff
        };
      });

    if (solvedQuestions.length === 0) {
      statusBox.className = "status-container status-error";
      statusBox.textContent = "No solved problems found in your LeetCode session.";
      btn.disabled = false;
      btn.textContent = "Sync Past Solved Problems";
      return;
    }

    btn.textContent = `Syncing ${solvedQuestions.length} problems...`;
    statusBox.textContent = `Sending ${solvedQuestions.length} solved problems to local sheet...`;

    // Send solved questions to local DSA Journey backend
    const syncResponse = await fetch("https://dsaflow-kjkc.onrender.com/api/problems/sync", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(solvedQuestions)
    });

    if (syncResponse.ok) {
      statusBox.className = "status-container status-success";
      statusBox.textContent = `Successfully synced ${solvedQuestions.length} solved problems to your sheet!`;
    } else {
      throw new Error(`Local server rejected the request with status: ${syncResponse.status}`);
    }

  } catch (error) {
    console.error("LeetCode Sync Pipeline Error:", error);
    statusBox.className = "status-container status-error";
    statusBox.textContent = error.message || "An unexpected error occurred.";
  } finally {
    btn.disabled = false;
    btn.textContent = "Sync Past Solved Problems";
  }
});
