package com.dsa.journey.service;

import com.dsa.journey.dto.ProblemRequest;
import com.dsa.journey.entity.Pattern;
import com.dsa.journey.entity.Problem;
import com.dsa.journey.entity.Revision;
import com.dsa.journey.repository.PatternRepository;
import com.dsa.journey.repository.ProblemRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class ProblemServiceTest {

    @Mock
    private ProblemRepository problemRepository;

    @Mock
    private PatternRepository patternRepository;

    @InjectMocks
    private ProblemService problemService;

    private Pattern mockPattern;

    @BeforeEach
    public void setUp() {
        mockPattern = Pattern.builder()
                .id(UUID.randomUUID())
                .name("Arrays")
                .build();
    }

    @Test
    public void testCreateProblemWithRevisionScheduled() {
        ProblemRequest request = new ProblemRequest();
        request.setLeetcodeNumber(1);
        request.setName("Two Sum");
        request.setUrl("https://leetcode.com/problems/two-sum/");
        request.setDifficulty("EASY");
        request.setStatus("REVISION_SCHEDULED");
        request.setDateSolved(LocalDate.of(2026, 8, 8));
        request.setAttemptsCount(1);
        request.setIndependentSolve(true);
        request.setPatternId(mockPattern.getId());
        request.setIntuition("Use map");
        request.setApproach("Check complement");
        request.setCodeSnippet("class Solution {}");
        request.setComplexityAnalysis("O(N)");
        request.setWhatILearned("Map is O(1) lookup");

        when(patternRepository.findById(mockPattern.getId())).thenReturn(Optional.of(mockPattern));
        when(problemRepository.save(any(Problem.class))).thenAnswer(invocation -> invocation.getArgument(0));

        Problem createdProblem = problemService.createProblem(request);

        assertNotNull(createdProblem);
        assertEquals("REVISION_SCHEDULED", createdProblem.getStatus());
        assertEquals(3, createdProblem.getRevisions().size());

        // Check due dates
        List<Revision> revisions = createdProblem.getRevisions();
        assertEquals(1, revisions.get(0).getRevisionNumber());
        assertEquals(LocalDate.of(2026, 8, 9), revisions.get(0).getDueDate());

        assertEquals(2, revisions.get(1).getRevisionNumber());
        assertEquals(LocalDate.of(2026, 8, 15), revisions.get(1).getDueDate());

        assertEquals(3, revisions.get(2).getRevisionNumber());
        assertEquals(LocalDate.of(2026, 9, 7), revisions.get(2).getDueDate());

        verify(problemRepository, times(1)).save(any(Problem.class));
    }
}
