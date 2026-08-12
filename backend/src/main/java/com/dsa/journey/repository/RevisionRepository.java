package com.dsa.journey.repository;

import com.dsa.journey.entity.Revision;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface RevisionRepository extends JpaRepository<Revision, UUID> {
    List<Revision> findAllByOrderByDueDateAsc();
    List<Revision> findByStatusOrderByDueDateAsc(String status);
    List<Revision> findByStatusAndDueDateLessThanEqual(String status, java.time.LocalDate dueDate);
}
