import { useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { api } from '../../services/api';
import type { Problem } from '../../services/api';
import ProblemFormModal from '../../components/problems/ProblemFormModal';
import './Patterns.css';

export default function Patterns() {
  const queryClient = useQueryClient();
  const { id: urlPatternId } = useParams<{ id?: string }>();
  const [expandedPatternId, setExpandedPatternId] = useState<string | null>(urlPatternId || null);

  // Modal State
  const [isAddModalOpen, setIsAddModalOpen] = useState(false);
  const [preselectedPatternId, setPreselectedPatternId] = useState<string | null>(null);

  const { data: patterns, isLoading: isPatternsLoading, error: patternsError } = useQuery({
    queryKey: ['patterns'],
    queryFn: api.getPatterns,
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
      queryClient.invalidateQueries({ queryKey: ['patterns'] });
    },
    onError: (error: any) => {
      alert(error.message || "Failed to update problem status.");
    }
  });

  const toggleExpand = (id: string) => {
    if (expandedPatternId === id) {
      setExpandedPatternId(null);
    } else {
      setExpandedPatternId(id);
    }
  };

  const getMasteryStatusLabel = (status: string) => {
    switch (status) {
      case 'NOT_STARTED': return 'Not Started';
      case 'LEARNING': return 'Learning';
      case 'MASTERED': return 'Mastered';
      default: return status;
    }
  };

  const openQuickAdd = (patternId: string) => {
    setPreselectedPatternId(patternId);
    setIsAddModalOpen(true);
  };

  if (isPatternsLoading || isProblemsLoading) {
    return (
      <div className="loading-container">
        <div className="spinner"></div>
        <p>Loading pattern library...</p>
      </div>
    );
  }

  if (patternsError) {
    return (
      <div className="error-container card">
        <h3 style={{ color: 'var(--error)' }}>Failed to load patterns</h3>
        <p style={{ color: 'var(--text-secondary)' }}>{(patternsError as Error).message}</p>
        <button className="btn btn-secondary" style={{ marginTop: '1rem' }} onClick={() => window.location.reload()}>
          Retry
        </button>
      </div>
    );
  }

  return (
    <div className="patterns-page">
      <p className="patterns-subtitle">
        Browse key recognition clues, structural complexity, generic approaches, and practice problems for placement-tested patterns.
      </p>

      <div className="patterns-list">
        {patterns?.map((pattern) => {
          const isExpanded = expandedPatternId === pattern.id || urlPatternId === pattern.id;

          // Filter problems belonging to this pattern
          const patternProblems = problems?.filter(p => p.pattern.id === pattern.id) || [];

          return (
            <div 
              key={pattern.id} 
              className={`pattern-card ${isExpanded ? 'expanded' : ''}`}
            >
              <div 
                className="pattern-card-header" 
                onClick={() => toggleExpand(pattern.id)}
              >
                <div className="pattern-title-section">
                  <span className="pattern-chevron">{isExpanded ? '▼' : '▶'}</span>
                  <h3 className="pattern-name">{pattern.name}</h3>
                </div>
                
                <div className="pattern-header-badges">
                  <span className={`mastery-badge mastery-${pattern.masteryStatus.toLowerCase()}`}>
                    {getMasteryStatusLabel(pattern.masteryStatus)}
                  </span>
                </div>
              </div>

              {isExpanded && (
                <div className="pattern-card-content">
                  <p className="pattern-desc">{pattern.description}</p>
                  
                  <div className="pattern-details-grid">
                    <div className="detail-section recognition">
                      <h4>Recognition Clues</h4>
                      <p>{pattern.recognitionClues || 'No recognition clues registered yet.'}</p>
                    </div>

                    <div className="detail-section intuition">
                      <h4>Intuition</h4>
                      <p>{pattern.intuition || 'No intuition documentation registered yet.'}</p>
                    </div>

                    <div className="detail-section approach">
                      <h4>Generic Approach</h4>
                      <p>{pattern.genericApproach || 'No approach steps registered yet.'}</p>
                    </div>

                    <div className="detail-section complexities">
                      <h4>Complexity Profiles</h4>
                      <div className="complexities-badges">
                        <div className="complexity-item">
                          <span className="complexity-label">Time:</span>
                          <code>{pattern.timeComplexity || 'N/A'}</code>
                        </div>
                        <div className="complexity-item">
                          <span className="complexity-label">Space:</span>
                          <code>{pattern.spaceComplexity || 'N/A'}</code>
                        </div>
                      </div>
                    </div>

                    <div className="detail-section mistakes">
                      <h4>Common Mistakes</h4>
                      <p>{pattern.commonMistakes || 'No mistakes logged yet.'}</p>
                    </div>
                  </div>

                  {/* Problems Table Section */}
                  <div className="detail-section pattern-problems-table-section">
                    <h4 style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '0.75rem' }}>
                      <span>Practice Problems ({patternProblems.length})</span>
                      <button 
                        className="btn btn-primary btn-xs"
                        onClick={() => openQuickAdd(pattern.id)}
                      >
                        + Add Problem
                      </button>
                    </h4>
                    {patternProblems.length > 0 ? (
                      <div className="problems-table-wrapper">
                        <table className="patterns-problems-table">
                          <thead>
                            <tr>
                              <th style={{ width: '60px', textAlign: 'center' }}>Solved</th>
                              <th>Problem</th>
                              <th>Practice</th>
                              <th>Level</th>
                              <th style={{ width: '80px', textAlign: 'center' }}>Detail</th>
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
                      <div className="empty-pattern-state">
                        <p>No practice problems logged for this pattern yet.</p>
                      </div>
                    )}
                  </div>
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
