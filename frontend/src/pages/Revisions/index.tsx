import { useState, useEffect } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { api } from '../../services/api';
import type { Revision } from '../../services/api';
import './Revisions.css';

export default function Revisions() {
  const queryClient = useQueryClient();
  const [activeTab, setActiveTab] = useState<'DUE' | 'UPCOMING' | 'COMPLETED' | 'SETTINGS'>('DUE');
  const [selectedRevision, setSelectedRevision] = useState<Revision | null>(null);
  const [showHints, setShowHints] = useState({
    trigger: false,
    intuition: false,
    approach: false,
    code: false,
  });
  const [rating, setRating] = useState<number | null>(null);
  const [notes, setNotes] = useState('');

  // Mobile settings states
  const [mobileNumber, setMobileNumber] = useState('');
  const [smsEnabled, setSmsEnabled] = useState(true);
  const [saveStatus, setSaveStatus] = useState<'IDLE' | 'SAVING' | 'SUCCESS' | 'ERROR'>('IDLE');
  const [testSmsStatus, setTestSmsStatus] = useState<'IDLE' | 'SENDING' | 'SUCCESS' | 'ERROR'>('IDLE');

  // Fetch revisions
  const { data: revisions, isLoading, error } = useQuery({
    queryKey: ['revisions'],
    queryFn: api.getRevisions,
  });

  // Fetch settings
  const { data: settings } = useQuery({
    queryKey: ['settings'],
    queryFn: api.getSettings,
  });

  // Sync initial settings state
  useEffect(() => {
    if (settings) {
      setMobileNumber(settings.mobileNumber || '');
      setSmsEnabled(settings.smsNotificationsEnabled);
    }
  }, [settings]);

  // Complete Revision Mutation
  const completeMutation = useMutation({
    mutationFn: ({ id, rating, notes }: { id: string; rating: number; notes: string }) =>
      api.completeRevision(id, { rating, notes }),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['revisions'] });
      queryClient.invalidateQueries({ queryKey: ['problems'] });
      setSelectedRevision(null);
      setRating(null);
      setNotes('');
      setShowHints({ trigger: false, intuition: false, approach: false, code: false });
    },
  });

  const getRevisionLabel = (num: number) => {
    switch (num) {
      case 1: return 'Review 1 (7-day)';
      case 2: return 'Review 2 (30-day)';
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

  const handleStartReview = (rev: Revision) => {
    setSelectedRevision(rev);
    setRating(null);
    setNotes('');
    setShowHints({ trigger: false, intuition: false, approach: false, code: false });
  };

  const handleSaveSettings = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaveStatus('SAVING');
    try {
      await api.updateSettings(mobileNumber, smsEnabled);
      setSaveStatus('SUCCESS');
      queryClient.invalidateQueries({ queryKey: ['settings'] });
      setTimeout(() => setSaveStatus('IDLE'), 3000);
    } catch (err) {
      setSaveStatus('ERROR');
      setTimeout(() => setSaveStatus('IDLE'), 3000);
    }
  };

  const handleTestSms = async () => {
    setTestSmsStatus('SENDING');
    try {
      await api.triggerTestSms();
      setTestSmsStatus('SUCCESS');
      setTimeout(() => setTestSmsStatus('IDLE'), 3000);
    } catch (err) {
      setTestSmsStatus('ERROR');
      setTimeout(() => setTestSmsStatus('IDLE'), 3000);
    }
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
                      onClick={() => handleStartReview(rev)}
                    >
                      🔄 Solve & Review
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

  const renderSettingsView = () => {
    return (
      <div className="settings-container card">
        <h3 className="settings-title">📞 Mobile SMS Revision Reminders</h3>
        <p className="settings-desc">
          Configure your mobile number to receive daily SMS text reminders with a summary of your due/overdue DSA revision patterns!
        </p>

        <form onSubmit={handleSaveSettings} className="settings-form">
          <div className="form-group">
            <label htmlFor="mobile-input">Mobile Phone Number</label>
            <input 
              type="text" 
              id="mobile-input" 
              placeholder="e.g. +1234567890 or +919876543210" 
              value={mobileNumber}
              onChange={(e) => setMobileNumber(e.target.value)}
              className="settings-input"
            />
            <small className="form-help">
              Include country code prefix (e.g., +91 for India, +1 for USA) for SMS routing.
            </small>
          </div>

          <div className="form-checkbox-group">
            <input 
              type="checkbox" 
              id="sms-enabled" 
              checked={smsEnabled}
              onChange={(e) => setSmsEnabled(e.target.checked)}
              className="settings-checkbox"
            />
            <label htmlFor="sms-enabled">Enable Daily Revision SMS Reminders</label>
          </div>

          <div className="settings-actions">
            <button 
              type="submit" 
              className="btn btn-primary" 
              disabled={saveStatus === 'SAVING'}
            >
              {saveStatus === 'SAVING' ? 'Saving...' : '💾 Save Settings'}
            </button>

            {settings?.mobileNumber && (
              <button 
                type="button" 
                className="btn btn-secondary" 
                disabled={testSmsStatus === 'SENDING'}
                onClick={handleTestSms}
              >
                {testSmsStatus === 'SENDING' ? 'Sending...' : '📨 Send Test SMS Now'}
              </button>
            )}
          </div>

          {saveStatus === 'SUCCESS' && (
            <div className="alert alert-success">Settings saved successfully!</div>
          )}
          {saveStatus === 'ERROR' && (
            <div className="alert alert-error">Failed to save settings. Please try again.</div>
          )}

          {testSmsStatus === 'SUCCESS' && (
            <div className="alert alert-success">Test SMS triggered! Check your mobile phone (or Spring Console log if using simulated SMS).</div>
          )}
          {testSmsStatus === 'ERROR' && (
            <div className="alert alert-error">Failed to trigger test SMS. Check backend terminal logs for errors.</div>
          )}
        </form>

        <div className="settings-info-card">
          <h5>💡 Setup Instructions</h5>
          <ul>
            <li>By default, SMS is simulated and logged to the Spring Boot console for quick testing without API fees.</li>
            <li>To enable real-world cellular SMS delivery, set environment variables:
              <code>TWILIO_ACCOUNT_SID</code>, <code>TWILIO_AUTH_TOKEN</code>, and <code>TWILIO_PHONE_NUMBER</code> on the backend before running.
            </li>
          </ul>
        </div>
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
        <button 
          className={`tab-btn ${activeTab === 'SETTINGS' ? 'active' : ''}`}
          onClick={() => setActiveTab('SETTINGS')}
        >
          ⚙️ Mobile Reminders
        </button>
      </div>

      {/* Content */}
      <div className="revisions-content">
        {activeTab === 'DUE' && renderRevisionList(dueRevisions, true)}
        {activeTab === 'UPCOMING' && renderRevisionList(upcomingRevisions, false)}
        {activeTab === 'COMPLETED' && renderRevisionList(completedRevisions, false)}
        {activeTab === 'SETTINGS' && renderSettingsView()}
      </div>

      {/* Spaced Repetition Interactive Overlay Modal */}
      {selectedRevision && (
        <div className="revision-modal-backdrop" onClick={() => setSelectedRevision(null)}>
          <div className="revision-modal-card card" onClick={(e) => e.stopPropagation()}>
            <div className="revision-modal-header">
              <div>
                <span className="revision-modal-badge">Round {selectedRevision.revisionNumber}</span>
                <h3 className="revision-modal-title">#{selectedRevision.problem.leetcodeNumber} {selectedRevision.problem.name}</h3>
              </div>
              <button className="close-modal-btn" onClick={() => setSelectedRevision(null)}>×</button>
            </div>

            <div className="revision-modal-body">
              {/* SRS Stats Widget */}
              <div className="srs-stats-widget">
                <div className="stat-item">
                  <span className="stat-label">Interval</span>
                  <span className="stat-value">{selectedRevision.problem.intervalDays || 0} days</span>
                </div>
                <div className="stat-item">
                  <span className="stat-label">Ease Factor</span>
                  <span className="stat-value">{(selectedRevision.problem.easeFactor || 2.5).toFixed(2)}</span>
                </div>
                <div className="stat-item">
                  <span className="stat-label">Repetitions</span>
                  <span className="stat-value">{selectedRevision.problem.repetitionCount || 0}</span>
                </div>
              </div>

              <div className="solve-cta-section">
                <a 
                  href={selectedRevision.problem.url} 
                  target="_blank" 
                  rel="noreferrer" 
                  className="btn btn-secondary solve-link-btn"
                >
                  💻 Solve on LeetCode ↗
                </a>
              </div>

              {/* Progressive Hints Section */}
              <div className="revision-hints-section">
                <h4>Active Recall Reference Notes</h4>
                
                <div className="hint-disclosure">
                  <button 
                    className={`hint-trigger-btn ${showHints.trigger ? 'active' : ''}`}
                    onClick={() => setShowHints(prev => ({ ...prev, trigger: !prev.trigger }))}
                  >
                    🔑 {showHints.trigger ? 'Hide' : 'Reveal'} Trigger / Clues
                  </button>
                  {showHints.trigger && (
                    <div className="hint-content">
                      <strong>Trigger:</strong> {selectedRevision.problem.pattern?.recognitionClues || 'No clues logged yet.'}
                    </div>
                  )}
                </div>

                <div className="hint-disclosure">
                  <button 
                    className={`hint-trigger-btn ${showHints.intuition ? 'active' : ''}`}
                    onClick={() => setShowHints(prev => ({ ...prev, intuition: !prev.intuition }))}
                  >
                    🧠 {showHints.intuition ? 'Hide' : 'Reveal'} Intuition Note
                  </button>
                  {showHints.intuition && (
                    <div className="hint-content">
                      <strong>Intuition:</strong> {selectedRevision.problem.pattern?.intuition || 'No intuition notes logged.'}
                    </div>
                  )}
                </div>

                <div className="hint-disclosure">
                  <button 
                    className={`hint-trigger-btn ${showHints.approach ? 'active' : ''}`}
                    onClick={() => setShowHints(prev => ({ ...prev, approach: !prev.approach }))}
                  >
                    💡 {showHints.approach ? 'Hide' : 'Reveal'} Pattern Approach
                  </button>
                  {showHints.approach && (
                    <div className="hint-content">
                      <strong>Approach:</strong> {selectedRevision.problem.pattern?.genericApproach || 'No approach notes logged.'}
                    </div>
                  )}
                </div>

                <div className="hint-disclosure">
                  <button 
                    className={`hint-trigger-btn ${showHints.code ? 'active' : ''}`}
                    onClick={() => setShowHints(prev => ({ ...prev, code: !prev.code }))}
                  >
                    📜 {showHints.code ? 'Hide' : 'Reveal'} My Saved Reference Code
                  </button>
                  {showHints.code && (
                    <div className="hint-content code-hint-content">
                      <pre className="revision-code-snippet">
                        <code>{selectedRevision.problem.detail?.codeSnippet || '// No code snippet saved.'}</code>
                      </pre>
                    </div>
                  )}
                </div>
              </div>

              {/* Notes Textarea */}
              <div className="revision-form-group">
                <label htmlFor="rev-notes">Mistakes or lessons from this review round (optional)</label>
                <textarea 
                  id="rev-notes" 
                  placeholder="e.g. Struggled with the binary search boundary checks, need to use mid = low + (high-low)/2."
                  value={notes}
                  onChange={(e) => setNotes(e.target.value)}
                  rows={3}
                />
              </div>

              {/* SM-2 Recall quality rating */}
              <div className="recall-rating-section">
                <h4>How was your active recall solve?</h4>
                <div className="recall-rating-grid">
                  <button 
                    className={`rating-btn rating-again ${rating === 1 ? 'selected' : ''}`}
                    onClick={() => setRating(1)}
                  >
                    <span className="rating-emoji">🟥</span>
                    <span className="rating-title">Again</span>
                    <span className="rating-desc">Forgot / failed</span>
                  </button>
                  <button 
                    className={`rating-btn rating-hard ${rating === 3 ? 'selected' : ''}`}
                    onClick={() => setRating(3)}
                  >
                    <span className="rating-emoji">🟨</span>
                    <span className="rating-title">Hard</span>
                    <span className="rating-desc">Struggled a lot</span>
                  </button>
                  <button 
                    className={`rating-btn rating-good ${rating === 4 ? 'selected' : ''}`}
                    onClick={() => setRating(4)}
                  >
                    <span className="rating-emoji">🟩</span>
                    <span className="rating-title">Good</span>
                    <span className="rating-desc">Solved cleanly</span>
                  </button>
                  <button 
                    className={`rating-btn rating-easy ${rating === 5 ? 'selected' : ''}`}
                    onClick={() => setRating(5)}
                  >
                    <span className="rating-emoji">🟦</span>
                    <span className="rating-title">Easy</span>
                    <span className="rating-desc">Instant recall</span>
                  </button>
                </div>
              </div>
            </div>

            <div className="revision-modal-footer">
              <button 
                className="btn btn-secondary" 
                onClick={() => setSelectedRevision(null)}
              >
                Cancel
              </button>
              <button 
                className="btn btn-primary" 
                disabled={rating === null || completeMutation.isPending}
                onClick={() => {
                  if (rating !== null) {
                    completeMutation.mutate({ id: selectedRevision.id, rating, notes });
                  }
                }}
              >
                {completeMutation.isPending ? 'Submitting...' : '✓ Submit Revision'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
