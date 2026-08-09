package com.dsa.journey.repository;

import com.dsa.journey.entity.Mistake;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface MistakeRepository extends JpaRepository<Mistake, UUID> {
    List<Mistake> findByProblemId(UUID problemId);
}
