package com.dsa.journey.service;

import com.dsa.journey.entity.UserSettings;
import com.dsa.journey.repository.UserSettingsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class UserSettingsService {

    private final UserSettingsRepository userSettingsRepository;
    private static final UUID DEFAULT_SETTINGS_ID = UUID.fromString("e0a00000-0000-0000-0000-000000000001");

    @Transactional(readOnly = true)
    public UserSettings getSettings() {
        return userSettingsRepository.findById(DEFAULT_SETTINGS_ID)
                .orElseGet(() -> {
                    UserSettings defaultSettings = UserSettings.builder()
                            .id(DEFAULT_SETTINGS_ID)
                            .mobileNumber(null)
                            .smsNotificationsEnabled(true)
                            .build();
                    return userSettingsRepository.save(defaultSettings);
                });
    }

    @Transactional
    public UserSettings updateSettings(String mobileNumber, Boolean smsNotificationsEnabled) {
        UserSettings settings = getSettings();
        if (mobileNumber != null) {
            settings.setMobileNumber(mobileNumber.trim().isEmpty() ? null : mobileNumber.trim());
        }
        if (smsNotificationsEnabled != null) {
            settings.setSmsNotificationsEnabled(smsNotificationsEnabled);
        }
        return userSettingsRepository.save(settings);
    }
}
