import { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { api } from '../../services/api';
import type { Revision } from '../../services/api';
import './Revisions.css';

export default function Revisions() {
  const queryClient = useQueryClient();
  const [activeTab, setActiveTab] = useState<'DUE' | 'UPCOMING' | 'COMPLETED'>('DUE');

  // Fetch revisions
  const { data: revisions, isLoading, error } = useQuery({
    queryKey: ['revisions'],
    queryFn: api.getRevisions,
  });

  // Complete Revision Mutation
  const completeMutation = useMutation({
    mutationFn: api.completeRevision,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['revisions'] });
      queryClient.invalidateQueries({ queryKey: ['problems'] });
    },
  });

  const getRevisionLabel = (num: number) => {
    switch (num) {
      case 1: return 'Review 1 (1-day)';
      case 2: return 'Review 2 (7-day)';
      case 3: return 'Review 3 (30-day)';
      default: return `Review ${num}`;
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

  const todayStr = new Date().toISOString().split('T')[0];

  // Filter lists
  const dueRevisions = revisions?.filter((r) => r.status === 'PENDING' && r.dueDate <= todayStr) || [];
  const upcomingRevisions = revisions?.filter((r) => r.status === 'PENDING' && r.dueDate > todayStr) || [];
  const completedRevisions = revisions?.filter((r) => r.status === 'COMPLETED') || [];

  const handleComplete = (id: string) => {
    completeMutation.mutate(id);
  };

  if (isLoading) {
    return (
      <div className="loading-container">
        <div className="spinner"></div>
        <p>Loading your revision hub...</p>
      </div>
    );
  }

  if (error) {
    return (
      <div className="error-container card">
        <h3 style={{ color: 'var(--error)' }}>Failed to load revisions</h3>
        <p style={{ color: 'var(--text-secondary)' }}>{(error as Error).message}</p>
        <button className="btn btn-secondary" style={{ marginTop: '1rem' }} onClick={() => window.location.reload()}>
          Retry
        </button>
      </div>
    );
  }

  const renderRevisionList = (list: Revision[], isDueTab: boolean) => {
    if (list.length === 0) {
      return (
        <div className="no-revisions card">
          <span className="no-revisions-icon">🎉</span>
          <p>No revisions found in this section.</p>
        </div>
      );
    }

    return (
      <div className="table-wrapper">
        <table className="custom-table">
          <thead>
            <tr>
              <th style={{ width: '120px' }}>Problem #</th>
              <th>Problem Title</th>
              <th>Pattern</th>
              <th>Difficulty</th>
              <th>Revision Round</th>
              <th>Due Date</th>
              {isDueTab && <th style={{ textAlign: 'right' }}>Action</th>}
            </tr>
          </thead>
          <tbody>
            {list.map((rev) => (
              <tr key={rev.id}>
                <td className="row-number">#{rev.problem.leetcodeNumber}</td>
                <td>
                  <a 
                    href={rev.problem.url} 
                    target="_blank" 
                    rel="noreferrer"
                    className="leetcode-link"
                  >
                    {rev.problem.name} ↗
                  </a>
                </td>
                <td>{rev.problem.pattern?.name || 'N/A'}</td>
                <td>{getDifficultyBadge(rev.problem.difficulty)}</td>
                <td>
                  <span className="revision-round-badge">
                    {getRevisionLabel(rev.revisionNumber)}
                  </span>
                </td>
                <td>
                  <span className={`due-date-meta ${isDueTab ? 'overdue' : ''}`}>
                    {rev.dueDate}
                  </span>
                </td>
                {isDueTab && (
                  <td style={{ textAlign: 'right' }}>
                    <button 
                      className="btn btn-primary btn-sm"
                      onClick={() => handleComplete(rev.id)}
                      disabled={completeMutation.isPending}
                    >
                      {completeMutation.isPending ? 'Saving...' : '✓ Reviewed'}
                    </button>
                  </td>
                )}
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    );
  };

  return (
    <div className="revisions-page">
      <p className="revisions-subtitle">
        Maintain long-term retention of DSA patterns. Solve previously solved problems again at scheduled intervals.
      </p>

      {/* Tabs */}
      <div className="revisions-tabs">
        <button 
          className={`tab-btn ${activeTab === 'DUE' ? 'active' : ''}`}
          onClick={() => setActiveTab('DUE')}
        >
          Due Today / Overdue
          {dueRevisions.length > 0 && <span className="tab-count-badge">{dueRevisions.length}</span>}
        </button>
        <button 
          className={`tab-btn ${activeTab === 'UPCOMING' ? 'active' : ''}`}
          onClick={() => setActiveTab('UPCOMING')}
        >
          Upcoming Schedule
        </button>
        <button 
          className={`tab-btn ${activeTab === 'COMPLETED' ? 'active' : ''}`}
          onClick={() => setActiveTab('COMPLETED')}
        >
          Completed Reviews
        </button>
      </div>

      {/* Content */}
      <div className="revisions-content">
        {activeTab === 'DUE' && renderRevisionList(dueRevisions, true)}
        {activeTab === 'UPCOMING' && renderRevisionList(upcomingRevisions, false)}
        {activeTab === 'COMPLETED' && renderRevisionList(completedRevisions, false)}
      </div>
    </div>
  );
}
