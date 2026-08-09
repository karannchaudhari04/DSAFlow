import { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { Link } from 'react-router-dom';
import { api } from '../../services/api';
import type { Problem } from '../../services/api';
import ProblemFormModal from '../../components/problems/ProblemFormModal';
import './Roadmap.css';

export default function Roadmap() {
  const queryClient = useQueryClient();
  const [openPhaseIds, setOpenPhaseIds] = useState<Record<string, boolean>>({});
  const [openPatternIds, setOpenPatternIds] = useState<Record<string, boolean>>({});

  // Modal State
  const [isAddModalOpen, setIsAddModalOpen] = useState(false);
  const [preselectedPatternId, setPreselectedPatternId] = useState<string | null>(null);

  const { data: phases, isLoading: isPhasesLoading, error: phasesError } = useQuery({
    queryKey: ['phases'],
    queryFn: api.getPhases,
  });

  const { data: problems, isLoading: isProblemsLoading } = useQuery({
    queryKey: ['problems'],
    queryFn: api.getProblems,
  });



  // Toggle Completion Mutation
  const toggleProblemCompleted = useMutation({
    mutationFn: async (problem: Problem) => {
      const nextStatus = problem.status === 'COMPLETED' || problem.status === 'MASTERED' 
        ? 'IN_PROGRESS' 
        : 'COMPLETED';

      return api.updateProblem(problem.id, {
        leetcodeNumber: problem.leetcodeNumber,
        name: problem.name,
        url: problem.url,
        difficulty: problem.difficulty,
        status: nextStatus,
        dateSolved: problem.dateSolved,
        timeTakenMinutes: problem.timeTakenMinutes,
        attemptsCount: problem.attemptsCount,
        independentSolve: problem.independentSolve,
        patternId: problem.pattern.id,
        intuition: problem.detail?.intuition || '',
        approach: problem.detail?.approach || '',
        codeSnippet: problem.detail?.codeSnippet || '',
        complexityAnalysis: problem.detail?.complexityAnalysis,
        whatILearned: problem.detail?.whatILearned,
        mistakes: problem.mistakes.map(m => ({
          description: m.description,
          correctUnderstanding: m.correctUnderstanding,
          isResolved: m.isResolved
        }))
      });
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['problems'] });
      queryClient.invalidateQueries({ queryKey: ['dashboard-stats'] });
      queryClient.invalidateQueries({ queryKey: ['phases'] });
    },
    onError: (error: any) => {
      alert(error.message || "Failed to update problem status.");
    }
  });

  const togglePhase = (id: string) => {
    setOpenPhaseIds((prev) => ({
      ...prev,
      [id]: !prev[id],
    }));
  };

  const togglePattern = (id: string, e: React.MouseEvent) => {
    e.stopPropagation();
    setOpenPatternIds((prev) => ({
      ...prev,
      [id]: !prev[id],
    }));
  };

  const getPriorityLabel = (priority: string) => {
    switch (priority) {
      case 'TIER_1_MASTER': return 'Tier 1';
      case 'TIER_2_STRONG': return 'Tier 2';
      case 'TIER_3_FUNDAMENTALS': return 'Tier 3';
      case 'TIER_4_ADVANCED': return 'Tier 4';
      default: return priority;
    }
  };

  const openQuickAdd = (patternId: string) => {
    setPreselectedPatternId(patternId);
    setIsAddModalOpen(true);
  };

  if (isPhasesLoading || isProblemsLoading) {
    return (
      <div className="loading-container">
        <div className="spinner"></div>
        <p>Loading your placement roadmap...</p>
      </div>
    );
  }

  if (phasesError) {
    return (
      <div className="error-container card">
        <h3 style={{ color: 'var(--error)' }}>Failed to load roadmap</h3>
        <p style={{ color: 'var(--text-secondary)' }}>{(phasesError as Error).message}</p>
        <button className="btn btn-secondary" style={{ marginTop: '1rem' }} onClick={() => window.location.reload()}>
          Retry
        </button>
      </div>
    );
  }

  return (
    <div className="roadmap-page">
      <div className="roadmap-header">
        <p className="roadmap-subtitle">
          Your complete structural path to placement readiness. Click on any topic to view and manage related problems spreadsheet-style.
        </p>
      </div>

      <div className="roadmap-accordion-list">
        {phases?.map((phase) => {
          const isOpen = !!openPhaseIds[phase.id];



          return (
            <div 
              key={phase.id} 
              className={`roadmap-accordion-row ${isOpen ? 'open' : ''} status-${phase.status.toLowerCase()}`}
            >
              {/* Accordion Header */}
              <div 
                className="accordion-header"
                onClick={() => togglePhase(phase.id)}
              >
                <div className="header-left">
                  <span className="accordion-chevron">{isOpen ? '▼' : '▶'}</span>
                  <h3 className="topic-title">{phase.topic.replace(/^Phase\s+\d+\s+—\s+/i, '')}</h3>
                  <span className={`priority-tag priority-${phase.priority.toLowerCase()}`}>
                    {getPriorityLabel(phase.priority)}
                  </span>
                </div>

                <div className="header-right">
                  <span className={`status-pill status-${phase.status.toLowerCase()}`}>
                    {phase.status.replace('_', ' ')}
                  </span>
                </div>
              </div>

              {/* Accordion Content */}
              {isOpen && (
                <div className="accordion-content">
                  {phase.patterns.length > 0 ? (
                    <div className="subtopics-list">
                      {phase.patterns
                        .sort((a, b) => a.sequenceOrder - b.sequenceOrder)
                        .map((pattern) => {
                          const patternProblems = problems?.filter(p => p.pattern.id === pattern.id) || [];
                          const solvedCount = patternProblems.filter(p => p.status === 'COMPLETED' || p.status === 'MASTERED').length;
                          const totalCount = patternProblems.length;
                          const percent = totalCount > 0 ? (solvedCount / totalCount) * 100 : 0;
                          const isPatternOpen = !!openPatternIds[pattern.id];

                          return (
                            <div key={pattern.id} className={`subtopic-section ${isPatternOpen ? 'open' : ''}`}>
                              {/* Subtopic Accordion Header */}
                              <div 
                                className="subtopic-accordion-header"
                                onClick={(e) => togglePattern(pattern.id, e)}
                              >
                                <div className="subtopic-header-left">
                                  <span className="subtopic-chevron">{isPatternOpen ? '▼' : '▶'}</span>
                                  <h4 className="subtopic-title">{pattern.name}</h4>
                                  <button 
                                    className="btn btn-ghost btn-xs add-problem-btn"
                                    onClick={(e) => {
                                      e.stopPropagation();
                                      openQuickAdd(pattern.id);
                                    }}
                                  >
                                    + Log
                                  </button>
                                </div>
                                <div className="subtopic-header-right">
                                  <div className="subtopic-progress-bar-wrapper">
                                    <div className="subtopic-progress-bar" style={{ width: `${percent}%` }}></div>
                                  </div>
                                  <span className="subtopic-progress-ratio">
                                    {solvedCount} / {totalCount}
                                  </span>
                                </div>
                              </div>

                              {/* Subtopic Expandable Content */}
                              {isPatternOpen && (
                                <div className="subtopic-accordion-content">
                                  {pattern.description && (
                                    <p className="subtopic-description">{pattern.description}</p>
                                  )}

                                  {patternProblems.length > 0 ? (
                                    <div className="problems-table-wrapper">
                                      <table className="roadmap-problems-table">
                                        <thead>
                                          <tr>
                                            <th style={{ width: '60px', textAlign: 'center' }}>Solved</th>
                                            <th>Problem</th>
                                            <th>Practice</th>
                                            <th>Level</th>
                                            <th style={{ width: '120px', textAlign: 'center' }}>Detail</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          {patternProblems.map((prob) => {
                                            const isCompleted = prob.status === 'COMPLETED' || prob.status === 'MASTERED';
                                            return (
                                              <tr key={prob.id} className={isCompleted ? 'row-completed' : ''}>
                                                <td style={{ textAlign: 'center' }}>
                                                  <input 
                                                    type="checkbox"
                                                    className="solved-checkbox"
                                                    checked={isCompleted}
                                                    onChange={() => toggleProblemCompleted.mutate(prob)}
                                                    disabled={toggleProblemCompleted.isPending}
                                                  />
                                                </td>
                                                <td className="problem-title-cell">
                                                  <Link to={`/problems/${prob.id}`} className="problem-link">
                                                    #{prob.leetcodeNumber} - {prob.name}
                                                  </Link>
                                                </td>
                                                <td>
                                                  <a 
                                                    href={prob.url} 
                                                    target="_blank" 
                                                    rel="noopener noreferrer" 
                                                    className="practice-code-btn"
                                                    title="Solve on LeetCode"
                                                  >
                                                    &lt;/&gt;
                                                  </a>
                                                </td>
                                                <td>
                                                  <span className={`difficulty-badge ${prob.difficulty.toLowerCase()}`}>
                                                    {prob.difficulty}
                                                  </span>
                                                </td>
                                                <td style={{ textAlign: 'center' }}>
                                                  <Link to={`/problems/${prob.id}`} className="btn btn-ghost btn-xs">
                                                    View
                                                  </Link>
                                                </td>
                                              </tr>
                                            );
                                          })}
                                        </tbody>
                                      </table>
                                    </div>
                                  ) : (
                                    <div className="empty-subtopic-state">
                                      <p>No practice problems logged for this subtopic yet.</p>
                                    </div>
                                  )}
                                </div>
                              )}
                            </div>
                          );
                        })}
                    </div>
                  ) : (
                    <div className="empty-topic-state">
                      <p>No subtopics registered for this topic yet.</p>
                    </div>
                  )}
                </div>
              )}
            </div>
          );
        })}
      </div>

      {/* Quick Add Problem Modal */}
      {isAddModalOpen && preselectedPatternId && (
        <ProblemFormModal
          isOpen={isAddModalOpen}
          onClose={() => {
            setIsAddModalOpen(false);
            setPreselectedPatternId(null);
          }}
          editProblem={null}
          defaultPatternId={preselectedPatternId}
        />
      )}
    </div>
  );
}
