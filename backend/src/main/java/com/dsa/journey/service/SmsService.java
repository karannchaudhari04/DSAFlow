package com.dsa.journey.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.Base64;

@Service
@Slf4j
public class SmsService {

    @Value("${twilio.account.sid:}")
    private String accountSid;

    @Value("${twilio.auth.token:}")
    private String authToken;

    @Value("${twilio.phone.number:}")
    private String fromPhoneNumber;

    private final RestTemplate restTemplate = new RestTemplate();

    public void sendSms(String toPhoneNumber, String messageBody) {
        if (accountSid == null || accountSid.isEmpty() ||
            authToken == null || authToken.isEmpty() ||
            fromPhoneNumber == null || fromPhoneNumber.isEmpty()) {
            
            log.info("====== [SMS MOCK SENDER] ======");
            log.info("To: {}", toPhoneNumber);
            log.info("Body: {}", messageBody);
            log.info("Configure 'twilio.account.sid', 'twilio.auth.token', and 'twilio.phone.number' in application.properties to enable real SMS notifications.");
            log.info("===============================");
            return;
        }

        try {
            String url = "https://api.twilio.com/2010-04-01/Accounts/" + accountSid + "/Messages.json";
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
            
            String auth = accountSid + ":" + authToken;
            String encodedAuth = Base64.getEncoder().encodeToString(auth.getBytes());
            headers.add("Authorization", "Basic " + encodedAuth);

            MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
            map.add("To", toPhoneNumber);
            map.add("From", fromPhoneNumber);
            map.add("Body", messageBody);

            HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(map, headers);
            ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);

            if (response.getStatusCode().is2xxSuccessful()) {
                log.info("Successfully sent SMS notification via Twilio to {}", toPhoneNumber);
            } else {
                log.error("Failed to send SMS via Twilio. Status: {}, Body: {}", response.getStatusCode(), response.getBody());
            }
        } catch (Exception e) {
            log.error("Error sending SMS via Twilio: ", e);
        }
    }
}
