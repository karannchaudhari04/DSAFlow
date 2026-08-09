import { useQuery } from '@tanstack/react-query';
import { Link } from 'react-router-dom';
import { api } from '../../services/api';
import './Dashboard.css';

export default function Dashboard() {
  const { data: stats, isLoading: statsLoading, error: statsError } = useQuery({
    queryKey: ['dashboard-stats'],
    queryFn: api.getDashboardStats,
  });

  const { data: problems, isLoading: problemsLoading } = useQuery({
    queryKey: ['problems'],
    queryFn: api.getProblems,
  });

  if (statsLoading || problemsLoading) {
    return (
      <div className="loading-container">
        <div className="spinner"></div>
        <p>Loading placement analytics...</p>
      </div>
    );
  }

  if (statsError) {
    return (
      <div className="error-container card">
        <h3 style={{ color: 'var(--error)' }}>Failed to load dashboard metrics</h3>
        <p style={{ color: 'var(--text-secondary)' }}>{(statsError as Error).message}</p>
        <button className="btn btn-secondary" style={{ marginTop: '1rem' }} onClick={() => window.location.reload()}>
          Retry
        </button>
      </div>
    );
  }

  // Calculate rate
  const totalSolved = stats?.totalSolved || 0;
  const masteryRate = totalSolved > 0 
    ? Math.round(((stats?.masteredCount || 0) / totalSolved) * 100) 
    : 0;

  const independentSolveRate = totalSolved > 0 
    ? Math.round(((stats?.independentSolveCount || 0) / totalSolved) * 100) 
    : 0;

  // Filter weakest topics: solvedCount > 0 but readinessPercentage < 100
  const weakestTopics = (stats?.topicReadinessList || [])
    .filter((topic) => topic.solvedCount > 0 && topic.readinessPercentage < 100)
    .sort((a, b) => a.readinessPercentage - b.readinessPercentage)
    .slice(0, 3);

  // Recent solved problems
  const recentProblems = problems ? [...problems].reverse().slice(0, 3) : [];

  const getDifficultyBadge = (difficulty: string) => {
    switch (difficulty) {
      case 'EASY': return <span className="badge badge-easy">Easy</span>;
      case 'MEDIUM': return <span className="badge badge-medium">Medium</span>;
      case 'HARD': return <span className="badge badge-hard">Hard</span>;
      default: return <span className="badge">{difficulty}</span>;
    }
  };

  return (
    <div className="dashboard-home">
      {/* Due Revisions Alert */}
      {stats && stats.dueRevisionsCount > 0 && (
        <div className="revision-alert-banner">
          <div className="alert-content">
            <span className="alert-icon">⏰</span>
            <div>
              <h4>Revisions Pending</h4>
              <p>You have {stats.dueRevisionsCount} revision rounds due today. Review them to solidify your memory.</p>
            </div>
          </div>
          <Link to="/revisions" className="btn btn-primary alert-btn">
            Go to Revision Hub
          </Link>
        </div>
      )}

      {/* Stats Cards */}
      <div className="dashboard-stats-grid">
        <div className="stat-summary-card card">
          <span className="stat-label">Total Solved</span>
          <span className="stat-number">{stats?.totalSolved}</span>
          <span className="stat-desc">Problems practiced</span>
        </div>

        <div className="stat-summary-card card">
          <span className="stat-label">Mastery Rate</span>
          <span className="stat-number">{masteryRate}%</span>
          <span className="stat-desc">{stats?.masteredCount} mastered logs</span>
        </div>

        <div className="stat-summary-card card">
          <span className="stat-label">Revisions Pending</span>
          <span className="stat-number">{stats?.dueRevisionsCount}</span>
          <span className="stat-desc">Rounds due today</span>
        </div>

        <div className="stat-summary-card card">
          <span className="stat-label">Independent Solves</span>
          <span className="stat-number">{independentSolveRate}%</span>
          <span className="stat-desc">{stats?.independentSolveCount} solved without hints</span>
        </div>
      </div>

      <div className="dashboard-content-split">
        {/* Left Section: Weakest Topics & Roadmap CTA */}
        <div className="content-left">
          <div className="dashboard-panel card">
            <div className="panel-header">
              <h3>Weakest Topics</h3>
              <Link to="/roadmap" className="panel-link">View Roadmap →</Link>
            </div>
            
            {weakestTopics.length > 0 ? (
              <div className="weak-topics-list">
                {weakestTopics.map((topic) => (
                  <div key={topic.phaseId} className="weak-topic-item">
                    <div className="weak-topic-info">
                      <span className="title">Phase {topic.phaseNumber}: {topic.topic}</span>
                      <span className="pct">{topic.readinessPercentage}%</span>
                    </div>
                    <div className="progress-bar-container">
                      <div 
                        className="progress-bar-fill"
                        style={{ width: `${topic.readinessPercentage}%`, backgroundColor: 'var(--error)' }}
                      ></div>
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <p className="no-data-msg">
                No active weak topics! Solve and log problems to track preparation stats.
              </p>
            )}
          </div>
        </div>

        {/* Right Section: Recent Solves */}
        <div className="content-right">
          <div className="dashboard-panel card">
            <div className="panel-header">
              <h3>Recent Solves</h3>
              <Link to="/problems" className="panel-link">View Practice Tracker →</Link>
            </div>

            {recentProblems.length > 0 ? (
              <div className="recent-solves-list">
                {recentProblems.map((problem) => (
                  <div key={problem.id} className="recent-solve-item">
                    <div className="recent-solve-main">
                      <span className="problem-num">#{problem.leetcodeNumber}</span>
                      <a 
                        href={problem.url} 
                        target="_blank" 
                        rel="noreferrer"
                        className="problem-name"
                      >
                        {problem.name} ↗
                      </a>
                    </div>
                    <div className="recent-solve-meta">
                      {getDifficultyBadge(problem.difficulty)}
                      <span className="date-solved">{problem.dateSolved}</span>
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <p className="no-data-msg">
                No problems logged yet. Go to Roadmap and practice!
              </p>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
