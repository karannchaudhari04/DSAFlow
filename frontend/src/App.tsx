import { useState } from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';

import Sidebar from './components/layout/Sidebar';
import Header from './components/layout/Header';
import ProblemFormModal from './components/problems/ProblemFormModal';

// Pages
import Dashboard from './pages/Dashboard';
import Roadmap from './pages/Roadmap';
import ProblemDetail from './pages/ProblemDetail';
import Revisions from './pages/Revisions';
import Mistakes from './pages/Mistakes';
import Readiness from './pages/Readiness';
import Analytics from './pages/Analytics';

// Create a client with optimized caching to prevent repeated, redundant API requests
const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 5 * 60 * 1000, // 5 minutes
      refetchOnWindowFocus: false, // Disable refetching every time window gets focus
      retry: 1, // Only retry once on failure
    },
  },
});

function AppRoutes() {
  const [isAddModalOpen, setIsAddModalOpen] = useState(false);

  return (
    <div className="app-shell">
      <Sidebar />
      <div className="main-content">
        <Header onAddProblemClick={() => setIsAddModalOpen(true)} />
        <main className="content-container">
          <Routes>
            <Route path="/" element={<Navigate to="/dashboard" replace />} />
            <Route path="/dashboard" element={<Dashboard />} />
            <Route path="/roadmap" element={<Roadmap />} />
            <Route path="/problems/:id" element={<ProblemDetail />} />
            <Route path="/revisions" element={<Revisions />} />
            <Route path="/mistakes" element={<Mistakes />} />
            <Route path="/readiness" element={<Readiness />} />
            <Route path="/analytics" element={<Analytics />} />
            <Route path="*" element={<Navigate to="/dashboard" replace />} />
          </Routes>
        </main>
      </div>

      {/* Global Quick Add Problem Modal */}
      <ProblemFormModal
        isOpen={isAddModalOpen}
        onClose={() => setIsAddModalOpen(false)}
        editProblem={null}
      />
    </div>
  );
}

export default function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <BrowserRouter>
        <AppRoutes />
      </BrowserRouter>
    </QueryClientProvider>
  );
}
