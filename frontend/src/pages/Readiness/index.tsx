import { useQuery } from '@tanstack/react-query';
import { api } from '../../services/api';
import './Readiness.css';

export default function Readiness() {
  const { data: stats, isLoading, error } = useQuery({
    queryKey: ['dashboard-stats'],
    queryFn: api.getDashboardStats,
  });

  const getPriorityLabel = (priority: string) => {
    switch (priority) {
      case 'TIER_1_MASTER': return 'Tier 1: Master';
      case 'TIER_2_PRACTICE': return 'Tier 2: Practice';
      case 'TIER_3_REVIEW': return 'Tier 3: Review';
      default: return priority;
    }
  };

  const getStatusLabel = (status: string) => {
    switch (status) {
      case 'NOT_STARTED': return 'Not Started';
      case 'IN_PROGRESS': return 'In Progress';
      case 'COMPLETED': return 'Completed';
      default: return status;
    }
  };

  if (isLoading) {
    return (
      <div className="loading-container">
        <div className="spinner"></div>
        <p>Loading topic readiness metrics...</p>
      </div>
    );
  }

  if (error) {
    return (
      <div className="error-container card">
        <h3 style={{ color: 'var(--error)' }}>Failed to load readiness metrics</h3>
        <p style={{ color: 'var(--text-secondary)' }}>{(error as Error).message}</p>
        <button className="btn btn-secondary" style={{ marginTop: '1rem' }} onClick={() => window.location.reload()}>
          Retry
        </button>
      </div>
    );
  }

  const list = stats?.topicReadinessList || [];

  return (
    <div className="readiness-page">
      <div className="readiness-header card">
        <h2>DSA Topic Readiness</h2>
        <p>
          Each topic is evaluated based on solving target goals. Solving at least 3 problems in a category achieves 100% initial phase coverage.
        </p>
      </div>

      <div className="readiness-grid">
        {list.map((topic) => (
          <div key={topic.phaseId} className="readiness-card card">
            <div className="readiness-card-header">
              <span className="phase-num">Phase {topic.phaseNumber}</span>
              <div className="badges-row">
                <span className={`status-badge ${topic.status.toLowerCase()}`}>
                  {getStatusLabel(topic.status)}
                </span>
                <span className={`priority-badge ${topic.priority.toLowerCase()}`}>
                  {getPriorityLabel(topic.priority)}
                </span>
              </div>
            </div>

            <h3 className="topic-title">{topic.topic}</h3>

            <div className="readiness-progress-section">
              <div className="progress-labels">
                <span>Preparation Level</span>
                <span className="pct">{topic.readinessPercentage}%</span>
              </div>
              <div className="progress-bar-container">
                <div 
                  className={`progress-bar-fill ${topic.readinessPercentage === 100 ? 'complete' : ''}`}
                  style={{ width: `${topic.readinessPercentage}%` }}
                ></div>
              </div>
            </div>

            <div className="readiness-card-footer">
              <div className="stat">
                <span className="label">Solved</span>
                <span className="val">{topic.solvedCount}</span>
              </div>
              <div className="stat">
                <span className="label">Mastered</span>
                <span className="val">{topic.masteredCount}</span>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
