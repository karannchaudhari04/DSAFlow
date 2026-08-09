package com.dsa.journey.repository;

import com.dsa.journey.entity.Problem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface ProblemRepository extends JpaRepository<Problem, UUID> {
    @Override
    @org.springframework.data.jpa.repository.EntityGraph(attributePaths = {"detail", "pattern"})
    List<Problem> findAll();

    @org.springframework.data.jpa.repository.EntityGraph(attributePaths = {"detail", "pattern"})
    List<Problem> findAllByOrderByLeetcodeNumberAsc();

    List<Problem> findByPatternId(UUID patternId);
    List<Problem> findByStatus(String status);
    List<Problem> findByLeetcodeNumber(Integer leetcodeNumber);
}
