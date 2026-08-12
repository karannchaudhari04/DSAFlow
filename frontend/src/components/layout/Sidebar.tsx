import { NavLink } from 'react-router-dom';
import { useQuery } from '@tanstack/react-query';
import { api } from '../../services/api';
import './Sidebar.css';

export default function Sidebar() {
  // Query to get pending revisions count dynamically for the sidebar badge
  const { data: revisions } = useQuery({
    queryKey: ['revisions'],
    queryFn: api.getRevisions,
  });

  const pendingRevisionsCount = revisions?.filter((r) => {
    const dueDate = new Date(r.dueDate);
    const today = new Date();
    return dueDate <= today && r.status === 'PENDING';
  }).length || 0;

  const menuItems = [
    { path: '/dashboard', label: 'Dashboard', icon: '📊' },
    { path: '/roadmap', label: 'Roadmap', icon: '🗺️' },
    { path: '/revisions', label: 'Revisions', icon: '🔄', badge: pendingRevisionsCount },
  ];

  return (
    <aside className="sidebar">
      <div className="sidebar-brand">
        <span className="brand-accent">⚡</span>
        <span className="brand-text">DSA Journey</span>
      </div>
      
      <nav className="sidebar-nav">
        {menuItems.map((item) => (
          <NavLink
            key={item.path}
            to={item.path}
            className={({ isActive }) => `sidebar-link ${isActive ? 'active' : ''}`}
          >
            <span className="sidebar-icon">{item.icon}</span>
            <span className="sidebar-label">{item.label}</span>
            {item.badge !== undefined && item.badge > 0 && (
              <span className="sidebar-badge">{item.badge}</span>
            )}
          </NavLink>
        ))}
      </nav>
      
      <div className="sidebar-footer">
        <div className="user-profile">
          <div className="avatar">GU</div>
          <div className="user-info">
            <span className="user-name">Guest User</span>
            <span className="user-role">Placement Mode</span>
          </div>
        </div>
      </div>
    </aside>
  );
}
