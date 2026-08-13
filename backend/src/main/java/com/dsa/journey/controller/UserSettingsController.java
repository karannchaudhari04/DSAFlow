package com.dsa.journey.controller;

import com.dsa.journey.entity.UserSettings;
import com.dsa.journey.service.UserSettingsService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/settings")
@RequiredArgsConstructor
public class UserSettingsController {

    private final UserSettingsService userSettingsService;
    private final com.dsa.journey.service.SmsNotificationScheduler smsNotificationScheduler;

    @GetMapping
    public ResponseEntity<UserSettings> getSettings() {
        return ResponseEntity.ok(userSettingsService.getSettings());
    }

    @PutMapping
    public ResponseEntity<UserSettings> updateSettings(
            @RequestParam(required = false) String mobileNumber,
            @RequestParam(required = false) Boolean smsNotificationsEnabled) {
        return ResponseEntity.ok(userSettingsService.updateSettings(mobileNumber, smsNotificationsEnabled));
    }

    @PostMapping("/trigger-sms")
    public ResponseEntity<String> triggerSmsManual() {
        smsNotificationScheduler.triggerNotification();
        return ResponseEntity.ok("SMS trigger completed!");
    }
}
