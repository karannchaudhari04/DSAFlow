import { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import { api } from '../../services/api';
import './Mistakes.css';

export default function Mistakes() {
  const [selectedPattern, setSelectedPattern] = useState('ALL');

  const { data: mistakes, isLoading, error } = useQuery({
    queryKey: ['mistakes'],
    queryFn: api.getMistakes,
  });

  const { data: patterns } = useQuery({
    queryKey: ['patterns'],
    queryFn: api.getPatterns,
  });

  // Filter mistakes
  const filteredMistakes = mistakes?.filter((m) => {
    return selectedPattern === 'ALL' || m.pattern?.id === selectedPattern;
  });

  if (isLoading) {
    return (
      <div className="loading-container">
        <div className="spinner"></div>
        <p>Loading your mistake bank...</p>
      </div>
    );
  }

  if (error) {
    return (
      <div className="error-container card">
        <h3 style={{ color: 'var(--error)' }}>Failed to load mistakes</h3>
        <p style={{ color: 'var(--text-secondary)' }}>{(error as Error).message}</p>
        <button className="btn btn-secondary" style={{ marginTop: '1rem' }} onClick={() => window.location.reload()}>
          Retry
        </button>
      </div>
    );
  }

  return (
    <div className="mistakes-page">
      {/* Filters */}
      <div className="mistakes-filter-bar card">
        <div className="filter-item select">
          <label className="form-label" style={{ marginBottom: '0.4rem', display: 'block' }}>Filter by Pattern</label>
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

      {/* Grid List */}
      {filteredMistakes && filteredMistakes.length > 0 ? (
        <div className="mistakes-grid">
          {filteredMistakes.map((mistake) => (
            <div key={mistake.id} className="mistake-card card">
              <div className="mistake-card-header">
                <span className="mistake-pattern-tag">{mistake.pattern?.name || 'General'}</span>
                <span className={`mistake-badge ${mistake.isResolved ? 'resolved' : 'unresolved'}`}>
                  {mistake.isResolved ? 'Resolved' : 'Weak Area'}
                </span>
              </div>

              <div className="mistake-body">
                <div className="mistake-section">
                  <span className="section-label incorrect">Incorrect Misconception</span>
                  <p className="section-text">{mistake.description}</p>
                </div>

                <div className="mistake-section">
                  <span className="section-label correct">Correct Understanding</span>
                  <p className="section-text">{mistake.correctUnderstanding}</p>
                </div>
              </div>

              <div className="mistake-footer">
                <div className="mistake-meta">
                  <span>Logged: <code>{mistake.dateCreated}</code></span>
                  <span>Revisions: <code>{mistake.revisionCount}</code></span>
                </div>
              </div>
            </div>
          ))}
        </div>
      ) : (
        <div className="card" style={{ padding: '2rem', textAlign: 'center', color: 'var(--text-muted)' }}>
          No mistakes logged in this category. Keep practicing!
        </div>
      )}
    </div>
  );
}
