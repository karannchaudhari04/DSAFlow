package com.dsa.journey.repository;

import com.dsa.journey.entity.ProblemDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ProblemDetailRepository extends JpaRepository<ProblemDetail, UUID> {
}
