package com.dsa.journey.repository;

import com.dsa.journey.entity.Phase;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface PhaseRepository extends JpaRepository<Phase, UUID> {
    @org.springframework.data.jpa.repository.EntityGraph(attributePaths = {"patterns"})
    List<Phase> findAllByOrderBySequenceOrderAsc();
}
