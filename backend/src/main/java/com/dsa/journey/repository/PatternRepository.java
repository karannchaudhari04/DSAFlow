package com.dsa.journey.repository;

import com.dsa.journey.entity.Pattern;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface PatternRepository extends JpaRepository<Pattern, UUID> {
    @Query("SELECT p FROM Pattern p ORDER BY p.phase.sequenceOrder ASC, p.sequenceOrder ASC")
    List<Pattern> findAllSortedForTeaching();

    List<Pattern> findByPhaseIdOrderBySequenceOrderAsc(UUID phaseId);
}
