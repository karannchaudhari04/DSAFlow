import { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { api } from '../../services/api';
import type { Problem } from '../../services/api';
import ProblemFormModal from '../../components/problems/ProblemFormModal';
import './Problems.css';

export default function Problems() {
  const queryClient = useQueryClient();
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedDifficulty, setSelectedDifficulty] = useState('ALL');
  const [selectedPattern, setSelectedPattern] = useState('ALL');
  const [expandedProblemId, setExpandedProblemId] = useState<string | null>(null);

  // Modal State
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [editingProblem, setEditingProblem] = useState<Problem | null>(null);

  // Fetch problems and patterns
  const { data: problems, isLoading, error } = useQuery({
    queryKey: ['problems'],
    queryFn: api.getProblems,
  });

  const { data: patterns } = useQuery({
    queryKey: ['patterns'],
    queryFn: api.getPatterns,
  });

  // Delete Mutation
  const deleteMutation = useMutation({
    mutationFn: api.deleteProblem,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['problems'] });
      queryClient.invalidateQueries({ queryKey: ['phases'] });
      queryClient.invalidateQueries({ queryKey: ['patterns'] });
      setExpandedProblemId(null);
    },
  });

  const toggleExpand = (id: string) => {
    setExpandedProblemId(expandedProblemId === id ? null : id);
  };

  const handleEditClick = (problem: Problem, e: React.MouseEvent) => {
    e.stopPropagation();
    setEditingProblem(problem);
    setIsModalOpen(true);
  };

  const handleDeleteClick = (id: string, e: React.MouseEvent) => {
    e.stopPropagation();
    if (window.confirm('Are you sure you want to delete this problem log?')) {
      deleteMutation.mutate(id);
    }
  };

  const getDifficultyBadge = (difficulty: string) => {
    switch (difficulty) {
      case 'EASY': return <span className="badge badge-easy">Easy</span>;
      case 'MEDIUM': return <span className="badge badge-medium">Medium</span>;
      case 'HARD': return <span className="badge badge-hard">Hard</span>;
      default: return <span className="badge">{difficulty}</span>;
    }
  };

  const getStatusLabel = (status: string) => {
    switch (status) {
      case 'NOT_STARTED': return 'Learning';
      case 'IN_PROGRESS': return 'Learning';
      case 'REVISION_SCHEDULED': return 'Revision';
      case 'MASTERED': return 'Mastered';
      default: return status;
    }
  };

  // Filter problems
  const filteredProblems = problems?.filter((p) => {
    const matchesSearch = 
      p.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
      p.leetcodeNumber.toString().includes(searchTerm);
    
    const matchesDifficulty = 
      selectedDifficulty === 'ALL' || p.difficulty === selectedDifficulty;
    
    const matchesPattern = 
      selectedPattern === 'ALL' || p.pattern.id === selectedPattern;

    return matchesSearch && matchesDifficulty && matchesPattern;
  });

  if (isLoading) {
    return (
      <div className="loading-container">
        <div className="spinner"></div>
        <p>Loading problems tracker...</p>
      </div>
    );
  }

  if (error) {
    return (
      <div className="error-container card">
        <h3 style={{ color: 'var(--error)' }}>Failed to load problems</h3>
        <p style={{ color: 'var(--text-secondary)' }}>{(error as Error).message}</p>
        <button className="btn btn-secondary" style={{ marginTop: '1rem' }} onClick={() => window.location.reload()}>
          Retry
        </button>
      </div>
    );
  }

  return (
    <div className="problems-page">
      {/* Filter Bar */}
      <div className="problems-filter-bar card">
        <div className="filter-item search">
          <input
            type="text"
            className="form-control"
            placeholder="Search problem name or LeetCode #..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>

        <div className="filter-item select">
          <select 
            className="form-control"
            value={selectedDifficulty}
            onChange={(e) => setSelectedDifficulty(e.target.value)}
          >
            <option value="ALL">All Difficulties</option>
            <option value="EASY">Easy</option>
            <option value="MEDIUM">Medium</option>
            <option value="HARD">Hard</option>
          </select>
        </div>

        <div className="filter-item select">
          <select 
            className="form-control"
            value={selectedPattern}
            onChange={(e) => setSelectedPattern(e.target.value)}
          >
            <option value="ALL">All Patterns</option>
            {patterns?.map((pat) => (
              <option key={pat.id} value={pat.id}>{pat.name}</option>
            ))}
          </select>
        </div>
      </div>

      {/* Problems List Table */}
      <div className="table-wrapper">
        <table className="custom-table">
          <thead>
            <tr>
              <th style={{ width: '40px' }}></th>
              <th style={{ width: '120px' }}>LeetCode #</th>
              <th>Problem Title</th>
              <th>Associated Pattern</th>
              <th>Difficulty</th>
              <th>Status</th>
              <th style={{ textAlign: 'right' }}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {filteredProblems && filteredProblems.length > 0 ? (
              filteredProblems.map((problem) => {
                const isExpanded = expandedProblemId === problem.id;
                return (
                  <>
                    <tr 
                      key={problem.id} 
                      className={`problem-row ${isExpanded ? 'expanded' : ''}`}
                      onClick={() => toggleExpand(problem.id)}
                    >
                      <td className="row-toggle">
                        {isExpanded ? '▼' : '▶'}
                      </td>
                      <td className="row-number">#{problem.leetcodeNumber}</td>
                      <td className="row-title">
                        <a 
                          href={problem.url} 
                          target="_blank" 
                          rel="noreferrer"
                          onClick={(e) => e.stopPropagation()}
                          className="leetcode-link"
                        >
                          {problem.name} ↗
                        </a>
                      </td>
                      <td className="row-pattern">{problem.pattern.name}</td>
                      <td className="row-difficulty">{getDifficultyBadge(problem.difficulty)}</td>
                      <td className="row-status">
                        <span className={`status-tag status-${problem.status.toLowerCase()}`}>
                          {getStatusLabel(problem.status)}
                        </span>
                      </td>
                      <td className="row-actions" onClick={(e) => e.stopPropagation()}>
                        <button className="action-btn edit" onClick={(e) => handleEditClick(problem, e)}>
                          Edit
                        </button>
                        <button className="action-btn delete" onClick={(e) => handleDeleteClick(problem.id, e)}>
                          Delete
                        </button>
                      </td>
                    </tr>

                    {isExpanded && (
                      <tr className="detail-row">
                        <td colSpan={7}>
                          <div className="problem-expanded-detail">
                            <div className="detail-grid">
                              <div className="detail-col">
                                <h4>Core Intuition</h4>
                                <p>{problem.detail?.intuition || 'No intuition logged.'}</p>

                                <h4 style={{ marginTop: '1.25rem' }}>Approach Steps</h4>
                                <p className="pre-wrap">{problem.detail?.approach || 'No approach steps logged.'}</p>
                              </div>

                              <div className="detail-col">
                                <h4>Java Solution Code</h4>
                                <pre className="code-block">
                                  <code>{problem.detail?.codeSnippet || '// No code saved.'}</code>
                                </pre>
                              </div>
                            </div>

                            <div className="complexity-and-lessons">
                              <div>
                                <strong>Complexity:</strong> <code>{problem.detail?.complexityAnalysis || 'N/A'}</code>
                              </div>
                              <div>
                                <strong>Independent Solve:</strong> {problem.independentSolve ? '✅ Yes' : '❌ Assisted'}
                              </div>
                              {problem.detail?.whatILearned && (
                                <div style={{ gridColumn: 'span 2' }}>
                                  <strong>Lesson Learned:</strong> <span style={{ color: 'var(--text-secondary)' }}>{problem.detail.whatILearned}</span>
                                </div>
                              )}
                            </div>

                            {/* Mistakes Bank Display */}
                            {problem.mistakes && problem.mistakes.length > 0 && (
                              <div className="detail-mistakes-section">
                                <h4>Logged Mistakes ({problem.mistakes.length})</h4>
                                <div className="mistakes-cards-grid">
                                  {problem.mistakes.map((mistake) => (
                                    <div key={mistake.id} className="mistake-display-card card">
                                      <div className="mistake-card-header">
                                        <span className={`mistake-status ${mistake.isResolved ? 'resolved' : 'unresolved'}`}>
                                          {mistake.isResolved ? 'Resolved' : 'Weak Area'}
                                        </span>
                                      </div>
                                      <p><strong>Attempt Misconception:</strong> {mistake.description}</p>
                                      <p><strong>Correct Understanding:</strong> {mistake.correctUnderstanding}</p>
                                    </div>
                                  ))}
                                </div>
                              </div>
                            )}
                          </div>
                        </td>
                      </tr>
                    )}
                  </>
                );
              })
            ) : (
              <tr>
                <td colSpan={7} className="no-records">
                  No problems logged matching the search parameters.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>

      {/* Unified Form Modal */}
      <ProblemFormModal
        isOpen={isModalOpen}
        onClose={() => {
          setIsModalOpen(false);
          setEditingProblem(null);
        }}
        editProblem={editingProblem}
      />
    </div>
  );
}
