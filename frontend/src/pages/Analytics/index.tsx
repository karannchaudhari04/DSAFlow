import { useQuery } from '@tanstack/react-query';
import { api } from '../../services/api';
import './Analytics.css';

export default function Analytics() {
  const { data: stats, isLoading: statsLoading, error: statsError } = useQuery({
    queryKey: ['dashboard-stats'],
    queryFn: api.getDashboardStats,
  });

  const { data: mistakes, isLoading: mistakesLoading } = useQuery({
    queryKey: ['mistakes'],
    queryFn: api.getMistakes,
  });

  if (statsLoading || mistakesLoading) {
    return (
      <div className="loading-container">
        <div className="spinner"></div>
        <p>Loading analytics visualization...</p>
      </div>
    );
  }

  if (statsError) {
    return (
      <div className="error-container card">
        <h3 style={{ color: 'var(--error)' }}>Failed to load analytics</h3>
        <p style={{ color: 'var(--text-secondary)' }}>{(statsError as Error).message}</p>
        <button className="btn btn-secondary" style={{ marginTop: '1rem' }} onClick={() => window.location.reload()}>
          Retry
        </button>
      </div>
    );
  }

  const total = stats?.totalSolved || 0;
  const easyPct = total > 0 ? Math.round(((stats?.easyCount || 0) / total) * 100) : 0;
  const medPct = total > 0 ? Math.round(((stats?.mediumCount || 0) / total) * 100) : 0;
  const hardPct = total > 0 ? Math.round(((stats?.hardCount || 0) / total) * 100) : 0;

  const resolvedMistakes = mistakes?.filter(m => m.isResolved).length || 0;
  const totalMistakes = mistakes?.length || 0;
  const weakMistakes = totalMistakes - resolvedMistakes;
  const mistakeResolutionRate = totalMistakes > 0 ? Math.round((resolvedMistakes / totalMistakes) * 100) : 0;

  const independentSolveRate = total > 0 ? Math.round(((stats?.independentSolveCount || 0) / total) * 100) : 0;

  return (
    <div className="analytics-page">
      <div className="analytics-grid">
        {/* Difficulty Breakdown */}
        <div className="analytics-card card">
          <h3>Difficulty Distribution</h3>
          <p className="desc-sub">Ratios of solved problems by LeetCode difficulty tags.</p>
          <div className="difficulty-bars">
            <div className="difficulty-item">
              <div className="label-row">
                <span className="diff-title easy">Easy</span>
                <span>{stats?.easyCount || 0} problems ({easyPct}%)</span>
              </div>
              <div className="progress-bar-container">
                <div className="progress-bar-fill easy-fill" style={{ width: `${easyPct}%` }}></div>
              </div>
            </div>

            <div className="difficulty-item">
              <div className="label-row">
                <span className="diff-title medium">Medium</span>
                <span>{stats?.mediumCount || 0} problems ({medPct}%)</span>
              </div>
              <div className="progress-bar-container">
                <div className="progress-bar-fill medium-fill" style={{ width: `${medPct}%` }}></div>
              </div>
            </div>

            <div className="difficulty-item">
              <div className="label-row">
                <span className="diff-title hard">Hard</span>
                <span>{stats?.hardCount || 0} problems ({hardPct}%)</span>
              </div>
              <div className="progress-bar-container">
                <div className="progress-bar-fill hard-fill" style={{ width: `${hardPct}%` }}></div>
              </div>
            </div>
          </div>
        </div>

        {/* Practice Performance Metrics */}
        <div className="analytics-card card">
          <h3>Practice Efficiency</h3>
          <p className="desc-sub">Analysis of independent solve success and revision backlogs.</p>
          <div className="performance-metrics">
            <div className="metric-row">
              <div className="metric-info">
                <span className="metric-title">Independent Solve Rate</span>
                <span className="metric-value">{independentSolveRate}%</span>
              </div>
              <div className="progress-bar-container">
                <div className="progress-bar-fill" style={{ width: `${independentSolveRate}%` }}></div>
              </div>
              <p className="metric-explanation">Solved without looking up hints or video solutions.</p>
            </div>

            <div className="metric-row" style={{ marginTop: '1.5rem' }}>
              <div className="metric-info">
                <span className="metric-title">Mistake Resolution Rate</span>
                <span className="metric-value">{mistakeResolutionRate}%</span>
              </div>
              <div className="progress-bar-container">
                <div className="progress-bar-fill" style={{ width: `${mistakeResolutionRate}%`, backgroundColor: 'var(--success)' }}></div>
              </div>
              <p className="metric-explanation">Ratios of solved mistakes converted from weak areas to resolved nodes.</p>
            </div>
          </div>
        </div>

        {/* Summary Counter Grid */}
        <div className="analytics-card card full-width">
          <h3>Summary Preparation Stats</h3>
          <div className="summary-stats-subgrid">
            <div className="summary-stat-node">
              <span className="node-num">{stats?.masteredCount || 0}</span>
              <span className="node-label">Mastered Problems</span>
            </div>
            <div className="summary-stat-node">
              <span className="node-num">{totalMistakes}</span>
              <span className="node-label">Total Mistakes Logged</span>
            </div>
            <div className="summary-stat-node">
              <span className="node-num">{weakMistakes}</span>
              <span className="node-label">Active Weak Areas</span>
            </div>
            <div className="summary-stat-node">
              <span className="node-num">{stats?.dueRevisionsCount || 0}</span>
              <span className="node-label">Due Today Revisions</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
