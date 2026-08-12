const API_BASE_URL = import.meta.env.VITE_API_URL || 'http://localhost:8080/api';

export interface Pattern {
  id: string;
  name: string;
  description: string;
  recognitionClues?: string;
  intuition?: string;
  genericApproach?: string;
  timeComplexity?: string;
  spaceComplexity?: string;
  commonMistakes?: string;
  masteryStatus: string;
  sequenceOrder: number;
  createdAt: string;
  updatedAt: string;
}

export interface Phase {
  id: string;
  phaseNumber: number;
  topic: string;
  priority: 'TIER_1_MASTER' | 'TIER_2_STRONG' | 'TIER_3_FUNDAMENTALS' | 'TIER_4_ADVANCED';
  status: 'NOT_STARTED' | 'IN_PROGRESS' | 'COMPLETED';
  sequenceOrder: number;
  patterns: Pattern[];
  createdAt: string;
  updatedAt: string;
}

export interface Mistake {
  id: string;
  pattern?: Pattern;
  description: string;
  correctUnderstanding: string;
  dateCreated: string;
  isResolved: boolean;
  revisionCount: number;
  createdAt: string;
  updatedAt: string;
}

export interface ProblemDetail {
  problemId: string;
  intuition: string;
  approach: string;
  codeSnippet: string;
  complexityAnalysis?: string;
  whatILearned?: string;
}

export interface Problem {
  id: string;
  leetcodeNumber: number;
  name: string;
  url: string;
  difficulty: 'EASY' | 'MEDIUM' | 'HARD';
  status: 'NOT_STARTED' | 'IN_PROGRESS' | 'COMPLETED' | 'REVISION_SCHEDULED' | 'MASTERED';
  dateSolved: string;
  timeTakenMinutes?: number | null;
  attemptsCount: number;
  independentSolve: boolean;
  pattern: Pattern;
  detail: ProblemDetail;
  purpose?: string;
  mistakes: Mistake[];
  easeFactor?: number;
  repetitionCount?: number;
  intervalDays?: number;
  createdAt: string;
  updatedAt: string;
}

export interface MistakeRequest {
  description: string;
  correctUnderstanding: string;
  isResolved?: boolean;
}

export interface ProblemRequest {
  leetcodeNumber: number;
  name: string;
  url: string;
  difficulty: 'EASY' | 'MEDIUM' | 'HARD';
  status: string;
  dateSolved: string;
  timeTakenMinutes?: number | null;
  attemptsCount: number;
  independentSolve: boolean;
  patternId: string;
  intuition: string;
  approach: string;
  codeSnippet: string;
  complexityAnalysis?: string;
  whatILearned?: string;
  purpose?: string;
  mistakes?: MistakeRequest[];
}

// Fetch helper with error handling
async function request<T>(endpoint: string, options?: RequestInit): Promise<T> {
  const url = `${API_BASE_URL}${endpoint}`;
  const response = await fetch(url, {
    headers: {
      'Content-Type': 'application/json',
    },
    ...options,
  });

  if (response.status === 244 || response.status === 204) {
    return null as unknown as T;
  }

  if (!response.ok) {
    const errText = await response.text();
    throw new Error(errText || `API Error: ${response.status} ${response.statusText}`);
  }

  // Handle empty responses
  const text = await response.text();
  return text ? (JSON.parse(text) as T) : (null as unknown as T);
}

export interface Revision {
  id: string;
  problem: Problem;
  revisionNumber: number;
  dueDate: string;
  status: 'PENDING' | 'COMPLETED';
  completedDate?: string | null;
  createdAt: string;
  updatedAt: string;
}

export const api = {
  // Phases & Patterns
  getPhases: () => request<Phase[]>('/phases'),
  getPatterns: () => request<Pattern[]>('/patterns'),
  getPatternsByPhase: (phaseId: string) => request<Pattern[]>(`/phases/${phaseId}/patterns`),

  // Problems CRUD
  getProblems: () => request<Problem[]>('/problems'),
  getProblem: (id: string) => request<Problem>(`/problems/${id}`),
  createProblem: (data: ProblemRequest) => request<Problem>('/problems', {
    method: 'POST',
    body: JSON.stringify(data),
  }),
  updateProblem: (id: string, data: ProblemRequest) => request<Problem>(`/problems/${id}`, {
    method: 'PUT',
    body: JSON.stringify(data),
  }),
  deleteProblem: (id: string) => request<void>(`/problems/${id}`, {
    method: 'DELETE',
  }),

  // Mistakes
  getMistakes: () => request<Mistake[]>('/mistakes'),

  // Revisions
  getRevisions: () => request<Revision[]>('/revisions'),
  completeRevision: (id: string, data?: { rating?: number; notes?: string }) => request<Revision>(`/revisions/${id}/complete`, {
    method: 'POST',
    body: data ? JSON.stringify(data) : undefined,
  }),

  // Dashboard Stats
  getDashboardStats: () => request<DashboardStats>('/dashboard/stats'),

  // User Settings
  getSettings: () => request<UserSettings>('/settings'),
  updateSettings: (mobileNumber: string, smsNotificationsEnabled: boolean) => request<UserSettings>(`/settings?mobileNumber=${encodeURIComponent(mobileNumber)}&smsNotificationsEnabled=${smsNotificationsEnabled}`, {
    method: 'PUT',
  }),
  triggerTestSms: () => request<string>('/settings/trigger-sms', {
    method: 'POST',
  }),
};

export interface UserSettings {
  id: string;
  mobileNumber?: string | null;
  smsNotificationsEnabled: boolean;
  createdAt: string;
  updatedAt: string;
}

export interface TopicReadiness {
  phaseId: string;
  phaseNumber: number;
  topic: string;
  solvedCount: number;
  masteredCount: number;
  readinessPercentage: number;
  priority: string;
  status: string;
}

export interface DashboardStats {
  totalSolved: number;
  easyCount: number;
  mediumCount: number;
  hardCount: number;
  masteredCount: number;
  mistakesCount: number;
  dueRevisionsCount: number;
  independentSolveCount: number;
  topicReadinessList: TopicReadiness[];
}
