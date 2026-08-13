package com.dsa.journey.service;

import com.dsa.journey.entity.Revision;
import com.dsa.journey.entity.UserSettings;
import com.dsa.journey.repository.RevisionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class SmsNotificationScheduler {

    private final RevisionRepository revisionRepository;
    private final UserSettingsService userSettingsService;
    private final SmsService smsService;

    // Runs every day at 8:00 AM
    @Scheduled(cron = "0 0 8 * * ?")
    public void sendDailyRevisionSms() {
        triggerNotification();
    }

    public void triggerNotification() {
        UserSettings settings = userSettingsService.getSettings();
        if (settings.getMobileNumber() == null || settings.getMobileNumber().isEmpty() || !settings.getSmsNotificationsEnabled()) {
            log.info("SMS notifications skipped: mobile number not configured or disabled.");
            return;
        }

        List<Revision> dueRevisions = revisionRepository.findByStatusAndDueDateLessThanEqual("PENDING", LocalDate.now());
        if (dueRevisions.isEmpty()) {
            log.info("No pending revisions due today.");
            return;
        }

        String problemList = dueRevisions.stream()
                .map(rev -> "• #" + rev.getProblem().getLeetcodeNumber() + " " + rev.getProblem().getName())
                .collect(Collectors.joining("\n"));

        String message = String.format(
                "⚡ DSA Journey: You have %d revision(s) due today! Keep up the pattern recall streak:\n\n%s\n\nSolve them here: https://dsa-flow-amber.vercel.app/revisions",
                dueRevisions.size(),
                problemList
        );

        smsService.sendSms(settings.getMobileNumber(), message);
    }
}
