import { useLocation } from 'react-router-dom';
import './Header.css';

interface HeaderProps {
  onAddProblemClick: () => void;
}

export default function Header({ onAddProblemClick }: HeaderProps) {
  const location = useLocation();

  // Helper to dynamically get page title
  const getPageTitle = () => {
    const path = location.pathname;
    if (path.startsWith('/dashboard')) return 'Dashboard';
    if (path.startsWith('/roadmap')) return 'DSA Roadmap';
    if (path.startsWith('/patterns')) return 'Patterns Library';
    if (path.startsWith('/problems')) return 'Problems Tracker';
    if (path.startsWith('/revisions')) return 'Revision Hub';
    if (path.startsWith('/mistakes')) return 'Mistake Bank';
    if (path.startsWith('/readiness')) return 'Placement Readiness';
    if (path.startsWith('/analytics')) return 'Analytics';
    return 'DSA Journey';
  };

  return (
    <header className="app-header">
      <div className="header-left">
        <h1 className="header-title">{getPageTitle()}</h1>
      </div>
      <div className="header-right">
        <button className="btn btn-primary" onClick={onAddProblemClick}>
          <span className="btn-icon">+</span>
          <span className="btn-text">Add Problem</span>
        </button>
      </div>
    </header>
  );
}
