package com.dsa.journey.service;

import com.dsa.journey.entity.Mistake;
import com.dsa.journey.repository.MistakeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class MistakeService {

    private final MistakeRepository mistakeRepository;

    public List<Mistake> getAllMistakes() {
        return mistakeRepository.findAll();
    }
}
