import { useEffect } from 'react';
import { useForm, useFieldArray } from 'react-hook-form';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { api } from '../../services/api';
import type { Problem, ProblemRequest } from '../../services/api';
import Modal from '../ui/Modal';
import './ProblemFormModal.css';

interface ProblemFormModalProps {
  isOpen: boolean;
  onClose: () => void;
  editProblem: Problem | null;
  defaultPatternId?: string | null;
}

interface FormValues {
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
  mistakes: Array<{
    description: string;
    correctUnderstanding: string;
    isResolved: boolean;
  }>;
}

export default function ProblemFormModal({ isOpen, onClose, editProblem, defaultPatternId }: ProblemFormModalProps) {
  const queryClient = useQueryClient();

  // Fetch patterns for the selection dropdown
  const { data: patterns } = useQuery({
    queryKey: ['patterns'],
    queryFn: api.getPatterns,
  });

  const {
    register,
    handleSubmit,
    control,
    reset,
    formState: { errors },
  } = useForm<FormValues>({
    defaultValues: {
      leetcodeNumber: 1,
      name: '',
      url: '',
      difficulty: 'EASY',
      status: 'IN_PROGRESS',
      dateSolved: new Date().toISOString().split('T')[0],
      timeTakenMinutes: null,
      attemptsCount: 1,
      independentSolve: true,
      patternId: '',
      intuition: '',
      approach: '',
      codeSnippet: '',
      complexityAnalysis: '',
      whatILearned: '',
      mistakes: [],
    },
  });

  const { fields, append, remove } = useFieldArray({
    control,
    name: 'mistakes',
  });

  // Reset form when editProblem changes
  useEffect(() => {
    if (editProblem) {
      reset({
        leetcodeNumber: editProblem.leetcodeNumber,
        name: editProblem.name,
        url: editProblem.url,
        difficulty: editProblem.difficulty,
        status: editProblem.status,
        dateSolved: editProblem.dateSolved,
        timeTakenMinutes: editProblem.timeTakenMinutes,
        attemptsCount: editProblem.attemptsCount,
        independentSolve: editProblem.independentSolve,
        patternId: editProblem.pattern.id,
        intuition: editProblem.detail?.intuition || '',
        approach: editProblem.detail?.approach || '',
        codeSnippet: editProblem.detail?.codeSnippet || '',
        complexityAnalysis: editProblem.detail?.complexityAnalysis || '',
        whatILearned: editProblem.detail?.whatILearned || '',
        mistakes: editProblem.mistakes?.map((m) => ({
          description: m.description,
          correctUnderstanding: m.correctUnderstanding,
          isResolved: m.isResolved,
        })) || [],
      });
    } else {
      reset({
        leetcodeNumber: 1,
        name: '',
        url: '',
        difficulty: 'EASY',
        status: 'IN_PROGRESS',
        dateSolved: new Date().toISOString().split('T')[0],
        timeTakenMinutes: null,
        attemptsCount: 1,
        independentSolve: true,
        patternId: defaultPatternId || (patterns && patterns.length > 0 ? patterns[0].id : ''),
        intuition: '',
        approach: '',
        codeSnippet: '',
        complexityAnalysis: '',
        whatILearned: '',
        mistakes: [],
      });
    }
  }, [editProblem, reset, patterns, isOpen, defaultPatternId]);

  // Mutations
  const createMutation = useMutation({
    mutationFn: api.createProblem,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['problems'] });
      queryClient.invalidateQueries({ queryKey: ['phases'] });
      queryClient.invalidateQueries({ queryKey: ['patterns'] });
      onClose();
    },
    onError: (error: any) => {
      alert(error.message || "Failed to create problem.");
    },
  });

  const updateMutation = useMutation({
    mutationFn: ({ id, data }: { id: string; data: ProblemRequest }) =>
      api.updateProblem(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['problems'] });
      queryClient.invalidateQueries({ queryKey: ['phases'] });
      queryClient.invalidateQueries({ queryKey: ['patterns'] });
      onClose();
    },
    onError: (error: any) => {
      alert(error.message || "Failed to update problem.");
    },
  });

  const onSubmit = (values: FormValues) => {
    const payload: ProblemRequest = {
      ...values,
      leetcodeNumber: Number(values.leetcodeNumber),
      attemptsCount: Number(values.attemptsCount),
      timeTakenMinutes: values.timeTakenMinutes ? Number(values.timeTakenMinutes) : null,
    };

    if (editProblem) {
      updateMutation.mutate({ id: editProblem.id, data: payload });
    } else {
      createMutation.mutate(payload);
    }
  };

  return (
    <Modal
      isOpen={isOpen}
      onClose={onClose}
      title={editProblem ? 'Edit Solved Problem' : 'Log New Solved Problem'}
    >
      <form onSubmit={handleSubmit(onSubmit)} className="problem-form">
        <div className="form-row-2">
          <div className="form-group">
            <label className="form-label">LeetCode #</label>
            <input
              type="number"
              className="form-control"
              {...register('leetcodeNumber', { required: 'LeetCode number is required', min: 1 })}
            />
            {errors.leetcodeNumber && <span className="form-error">{errors.leetcodeNumber.message}</span>}
          </div>

          <div className="form-group">
            <label className="form-label">Problem Name</label>
            <input
              type="text"
              className="form-control"
              placeholder="e.g., Two Sum"
              {...register('name', { required: 'Name is required' })}
            />
            {errors.name && <span className="form-error">{errors.name.message}</span>}
          </div>
        </div>

        <div className="form-group">
          <label className="form-label">LeetCode URL</label>
          <input
            type="url"
            className="form-control"
            placeholder="https://leetcode.com/problems/..."
            {...register('url', { required: 'URL is required' })}
          />
          {errors.url && <span className="form-error">{errors.url.message}</span>}
        </div>

        <div className="form-row-3">
          <div className="form-group">
            <label className="form-label">Difficulty</label>
            <select className="form-control" {...register('difficulty')}>
              <option value="EASY">Easy</option>
              <option value="MEDIUM">Medium</option>
              <option value="HARD">Hard</option>
            </select>
          </div>

          <div className="form-group">
            <label className="form-label">Status</label>
            <select className="form-control" {...register('status')}>
              <option value="IN_PROGRESS">Learning</option>
              <option value="REVISION_SCHEDULED">Revision Scheduled</option>
              <option value="MASTERED">Mastered</option>
            </select>
          </div>

          <div className="form-group">
            <label className="form-label">Date Solved</label>
            <input
              type="date"
              className="form-control"
              {...register('dateSolved', { required: 'Date solved is required' })}
            />
          </div>
        </div>

        <div className="form-row-3">
          <div className="form-group">
            <label className="form-label">Associated Pattern</label>
            <select className="form-control" {...register('patternId', { required: 'Pattern is required' })}>
              {patterns?.map((p) => (
                <option key={p.id} value={p.id}>
                  {p.name}
                </option>
              ))}
            </select>
          </div>

          <div className="form-group">
            <label className="form-label">Time Taken (mins)</label>
            <input
              type="number"
              className="form-control"
              placeholder="e.g., 20"
              {...register('timeTakenMinutes')}
            />
          </div>

          <div className="form-group">
            <label className="form-label">Attempts</label>
            <input
              type="number"
              className="form-control"
              {...register('attemptsCount', { min: 1 })}
            />
          </div>
        </div>

        <div className="form-group checkbox-group">
          <label className="checkbox-label">
            <input type="checkbox" {...register('independentSolve')} />
            Solved independently (without looking at solutions)
          </label>
        </div>

        <div className="form-section-divider">Solution Details</div>

        <div className="form-group">
          <label className="form-label">Core Intuition</label>
          <textarea
            className="form-control textarea-small"
            placeholder="Explain the main insight or key idea that unlocks this problem..."
            {...register('intuition', { required: 'Intuition is required' })}
          />
          {errors.intuition && <span className="form-error">{errors.intuition.message}</span>}
        </div>

        <div className="form-group">
          <label className="form-label">Approach Steps</label>
          <textarea
            className="form-control textarea-small"
            placeholder="Step-by-step logic (e.g. 1. Maintain two pointers, 2. Advance until...)"
            {...register('approach', { required: 'Approach is required' })}
          />
          {errors.approach && <span className="form-error">{errors.approach.message}</span>}
        </div>

        <div className="form-group">
          <label className="form-label">Java Solution Code</label>
          <textarea
            className="form-control textarea-code"
            placeholder="class Solution { ... }"
            {...register('codeSnippet', { required: 'Java code is required' })}
          />
          {errors.codeSnippet && <span className="form-error">{errors.codeSnippet.message}</span>}
        </div>

        <div className="form-row-2">
          <div className="form-group">
            <label className="form-label">Complexity (Time & Space)</label>
            <input
              type="text"
              className="form-control"
              placeholder="e.g. Time: O(N), Space: O(1)"
              {...register('complexityAnalysis')}
            />
          </div>

          <div className="form-group">
            <label className="form-label">What I Learned / Critical Lesson</label>
            <input
              type="text"
              className="form-control"
              placeholder="e.g. Remember to handle duplicate values..."
              {...register('whatILearned')}
            />
          </div>
        </div>

        <div className="form-section-divider">
          <span>Mistakes Bank</span>
          <button
            type="button"
            className="btn btn-secondary btn-sm btn-icon-only"
            style={{ padding: '0.2rem 0.5rem', borderRadius: '4px' }}
            onClick={() => append({ description: '', correctUnderstanding: '', isResolved: false })}
          >
            + Add Mistake
          </button>
        </div>

        {fields.length > 0 ? (
          <div className="mistakes-form-list">
            {fields.map((field, index) => (
              <div key={field.id} className="mistake-form-item card">
                <div className="mistake-form-header">
                  <h5>Mistake #{index + 1}</h5>
                  <button
                    type="button"
                    className="mistake-delete-btn"
                    onClick={() => remove(index)}
                  >
                    Remove
                  </button>
                </div>
                <div className="form-group">
                  <label className="form-label">Incorrect Attempt / Misconception</label>
                  <textarea
                    className="form-control textarea-small"
                    placeholder="Describe what you did wrong (e.g. Used max heap instead of min heap)..."
                    {...register(`mistakes.${index}.description` as const, { required: true })}
                  />
                </div>
                <div className="form-group">
                  <label className="form-label">Correct Understanding</label>
                  <textarea
                    className="form-control textarea-small"
                    placeholder="Describe the correct logic..."
                    {...register(`mistakes.${index}.correctUnderstanding` as const, { required: true })}
                  />
                </div>
              </div>
            ))}
          </div>
        ) : (
          <p className="no-mistakes-text">No mistakes logged for this problem yet.</p>
        )}

        <div className="form-actions">
          <button type="button" className="btn btn-secondary" onClick={onClose}>
            Cancel
          </button>
          <button
            type="submit"
            className="btn btn-primary"
            disabled={createMutation.isPending || updateMutation.isPending}
          >
            {createMutation.isPending || updateMutation.isPending ? 'Saving...' : editProblem ? 'Save Changes' : 'Log Problem'}
          </button>
        </div>
      </form>
    </Modal>
  );
}
