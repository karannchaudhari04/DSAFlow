import { useParams } from 'react-router-dom';

export default function ProblemDetail() {
  const { id } = useParams<{ id: string }>();
  return (
    <div className="card">
      <h2>Problem Detail View</h2>
      <p style={{ color: 'var(--text-secondary)' }}>Viewing details for problem: <code>{id}</code></p>
    </div>
  );
}
