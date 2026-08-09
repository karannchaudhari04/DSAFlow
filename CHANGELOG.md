# Changelog

All notable changes to the "DSA Journey" project will be documented in this file.

## [1.2.0] - 2026-08-08
### Added
- Integrated interactive, spreadsheet-style Problems Tables inside the expanded content of the `/roadmap` accordions and the `/patterns` card views.
- Columns display checkbox solved updates, `#leetcodeNumber - name` click-through links, direct `</>` LeetCode practice links, and colorful level difficulty badges.
- Configured checkable toggling that directly triggers backend update mutations to modify problem status between `COMPLETED` and `IN_PROGRESS`.
- Implemented call-to-action empty states that support quick-logging a new problem with pre-selected categories directly from the accordion workspace.
- Updated `ProblemFormModal` to accept a `defaultPatternId` prop for pre-selections.

### Verified
- Checked client frontend compiles cleanly (`npm run build` succeeds).

## [1.1.0] - 2026-08-08
### Added
- Refactored the `/roadmap` page layout into a collapsible accordion-style row checklist matching premium aesthetics.
- Removed all "Day X" labels from phase rows, rendering the topic titles directly (e.g. `Java Foundations`, `DSA Foundations`, `Arrays`, `Strings`).
- Mapped solved problem counts to total patterns in each phase row header dynamically.
- Implemented serialized, numbered list grids for pattern cards inside the expanded accordion rows.

### Verified
- Checked client frontend compiles cleanly (`npm run build` succeeds).

## [1.0.0] - 2026-08-08
### Removed
- Completely removed all login, register, JWT parsing, and spring security isolation blocks from the codebase.
- Dropped `users` table and reverted the composite unique constraint on `problems` to a single-column constraint on `leetcode_number` via migration `V10__remove_users_and_auth.sql`.
- Deleted all backend authentication filter, context, custom user details, and endpoint controller files.
- Reverted all repositories and services querying patterns to extract data globally rather than filtering by user ID context.
- Deleted frontend `AuthContext.tsx`, `ProtectedRoute.tsx`, `Login.tsx`, and `Register.tsx` forms and folders.
- Reverted `App.tsx` routes to render dashboard shells publicly directly without login guards, and restored `Sidebar.tsx` profile footer to Guest details.
- Reverted API client helper file to remove headers interception and bearer token injection.

### Verified
- Built and ran JUnit/MockMvc tests successfully without credentials dependencies.
- Verified client frontend builds successfully (`npm run build` succeeds).

## [0.9.0] - 2026-08-08
### Added
- Created backend multi-stage `Dockerfile` compiling code using Gradle inside Docker.
- Updated `docker-compose.yml` to spin up both PostgreSQL database and Spring Boot backend containers in a bridged private network.
- Created root `README.md` documentation explaining prerequisites, setup guides, and running locally vs using Docker.

### Verified
- Tested all MockMvc security block and scheduled repetition test suites locally.
- Checked frontend compiles cleanly.

## [0.8.0] - 2026-08-08
### Added
- Standardized frontend React Query states displaying visual skeleton loading logs and spinner elements.
- Protected interactive forms by locking submission buttons when mutations are pending to block double submits.
- Created `ProblemServiceTest` Mockito unit tests validating 1-day, 7-day, and 30-day revision scheduled targets.
- Created `ProblemControllerTest` MockMvc integration test verifying JWT auth endpoints are secured with HTTP 403 blocks.

### Verified
- Tested all backend integration tests pass (`./gradlew test` execution).
- Checked frontend compiles without strict layout errors (`npm run build` succeeds).

## [0.7.0] - 2026-08-08
### Added
- Linked JJWT libraries to backend configuration for token serialization.
- Created `V9__create_users_and_add_user_id.sql` setting up credentials schema, default `demo_user` accounts, and problem owners relations.
- Dropped single unique constraints on `leetcode_number` to replace with composite `(user_id, leetcode_number)` uniqueness for multi-user support.
- Created `User` JPA Entity and `UserRepository` lookup interfaces.
- Implemented `JwtTokenProvider`, `JwtAuthenticationFilter`, and `CustomUserDetailsService` resolving stateless sessions.
- Created `AuthController` supporting registration and login validation.
- Updates to `ProblemRepository`, `RevisionRepository`, and `MistakeRepository` adding user parameters.
- Restructured `ProblemService`, `RevisionService`, `MistakeService`, and `DashboardService` querying and locking records to the logged-in context user.
- Created React Auth Context Provider and Protected Route guards wrapper.
- Built Login and Register forms, mapping the theme layout, and updated request helper to attach Authorization bearer tokens.

### Verified
- Tested unauthenticated API returns HTTP 403 Forbidden.
- Tested user credentials mapping and registration returns token headers.
- Checked frontend compiles without warnings (`npm run build` succeeds).

## [0.6.0] - 2026-08-08
### Added
- Created `DashboardStatsResponse` and nested `TopicReadiness` DTO models.
- Created `DashboardService` calculating total solved counts, LeetCode difficulty breakdowns, independent solve rates, revision queue count, mistake stats, and dynamic topic readiness metrics for all 18 phases.
- Created `DashboardController` exposing `/api/dashboard/stats` REST endpoint.
- Updated frontend `api.ts` adding dashboard typings and fetch call `getDashboardStats`.
- Created `/readiness` (Topic Readiness) dashboard showing prep levels and status badges for the 18 phases.
- Created `/dashboard` home screen displaying placement status counters, pending revision banners, weakest topic logs, and practice logs.
- Created `/analytics` visualization rendering difficulty bar distributions, practice efficiency rates, and preparation counters.

### Verified
- Tested dashboard stats endpoint returns correctly formatted JSON.
- Tested Frontend compilation: `npm run build` succeeds without compilation errors.

## [0.5.0] - 2026-08-08
### Added
- Created `Revision` JPA Entity model under `com.dsa.journey.entity` representing spaced-repetition schedules.
- Created `RevisionRepository` interface.
- Implemented automatic 1-day, 7-day, and 30-day revision scheduling inside `ProblemService` when problem status is configured as `REVISION_SCHEDULED`.
- Implemented `RevisionService` and `RevisionController` exposing `/api/revisions` and `/api/revisions/{id}/complete` POST endpoint. Marking a revision as complete checks remaining due items, automatically changing problem status to `MASTERED` when all 3 review cycles finish.
- Created `MistakeService` and `MistakeController` exposing `/api/mistakes`.
- Updated frontend `api.ts` exposing the `Revision` type and fetches (`getMistakes`, `getRevisions`, `completeRevision`).
- Created `/mistakes` (Mistake Bank) dashboard component allowing users to filter misconception entries by pattern category.
- Created `/revisions` (Revision Hub) component, rendering PENDING and COMPLETED reviews across three functional tabs: Due Today, Upcoming Schedule, and Completed Reviews. Clicking the checkmark button marks a due item as reviewed.

### Verified
- Tested backend completion flow: POSTing revision completion updates database status and auto-promotes problems.
- Tested Frontend compilation: `npm run build` succeeds without strict TS type errors.

## [0.4.0] - 2026-08-08
### Added
- Created `Problem`, `ProblemDetail`, and `Mistake` JPA Entity classes under `com.dsa.journey.entity` mapping one-to-one and one-to-many database constraints with cascading deletes.
- Created `ProblemRepository`, `ProblemDetailRepository`, and `MistakeRepository` interfaces.
- Implemented `ProblemRequest` DTO contract and `ProblemService` coordinating cascade saves, updates, and deletes.
- Created `ProblemController` exposing `/api/problems` CRUD REST endpoints.
- Updated frontend `api.ts` exposing interfaces (`Problem`, `ProblemRequest`) and API methods (`getProblems`, `getProblem`, `createProblem`, `updateProblem`, `deleteProblem`).
- Created operational `ProblemFormModal` component using React Hook Form to capture input validation, dropdown pattern bindings, and dynamic mistakes list forms.
- Created `/problems` dashboard component displaying solved problems in a responsive custom table with difficulty badges, status tags, search/filters, actions (edit/delete), and in-row details expansion.

### Verified
- Tested backend CRUD calls: POST problem, PUT edit attempts, and DELETE problem logs respond correctly and cascade to database details.
- Tested Frontend compilation: `npm run build` succeeds without strict TS type errors.

## [0.3.0] - 2026-08-08
### Added
- Created `Phase` and `Pattern` JPA Entity models under `com.dsa.journey.entity` representing databases metadata tables with Eager loading and Jackson cyclic-ref overrides.
- Implemented `PhaseRepository` and `PatternRepository` interfaces supporting sorted collections by sequence.
- Created `RoadmapService` and `RoadmapController` exposing `/api/phases` (embedding child patterns), `/api/patterns`, and `/api/phases/{id}/patterns` routes.
- Wrote `SecurityConfig` configuring CORS rules allowing `http://localhost:5173` and permitting access to `/api/**` endpoints.
- Formed frontend api client under `/frontend/src/services/api.ts` wrapping fetch endpoints and type contracts.
- Built interactive visual `/roadmap` page component featuring color prioritization keys, sequence indicators, status tracking labels, and nested pattern lists.
- Built expandable `/patterns` page component displaying recognition clues, complexity profiles, generic approaches, and common mistakes.

### Verified
- Tested REST responses: `Invoke-RestMethod -Uri http://localhost:8080/api/phases` returns all 18 seeded phases with nested pattern JSON.
- Tested Frontend compilation: `npm run build` succeeds.

## [0.2.0] - 2026-08-08
### Added
- Created global Vanilla CSS design system under `/frontend/src/index.css` defining custom dark theme variables (`--bg-primary`, `--bg-secondary`, `--primary`, accents, semantic states, shadow profiles, font families).
- Created Sidebar layout component (`/frontend/src/components/layout/Sidebar.tsx` / `Sidebar.css`) with responsive collapsing side-bar navigation and path-active styling matching the layout routes.
- Created Header component (`/frontend/src/components/layout/Header.tsx` / `Header.css`) linking page context titles and rendering a global `+ Add Problem` button stub.
- Created reusable Modal overlay component (`/frontend/src/components/ui/Modal.tsx` / `Modal.css`) featuring custom responsive scaling and blur backdrop filters.
- Setup React Router switch paths mapping to stub pages (`/dashboard`, `/roadmap`, `/patterns`, `/problems`, `/revisions`, `/mistakes`, `/readiness`, `/analytics`).
- Integrated global QueryClientProvider (TanStack Query) wrap inside `App.tsx` preparing the client state bindings for Sprint 2.

### Changed
- Removed unused default `App.css` and imports.
- Fixed TypeScript compiler errors (`error TS6133: 'React' is declared but its value is never read.`) across layout files and page index files by importing only necessary dependencies.

### Verified
- Checked compilation and typing: `npm run build` succeeds in 2.00s.
- Checked dev server: `npm run dev` boots without runtime or routing warnings on port 5173.

## [0.1.0] - 2026-08-08
### Added
- Created monorepo workspace containing `/backend` (Spring Boot) and `/frontend` (React + Vite + TS).
- Added `docker-compose.yml` for day-one local PostgreSQL setup.
- Added `.env.example` defining database parameters, JWT secret, and server ports.
- Created 8 Flyway database migrations:
  - `V1__create_phases.sql` for phase structures.
  - `V2__create_patterns.sql` for patterns catalog.
  - `V3__create_problems.sql` for user-managed problems.
  - `V4__create_problem_details.sql` for solution details (cascade delete).
  - `V5__create_mistakes.sql` for mistake records (cascade delete).
  - `V6__create_revisions.sql` for revision schedules (cascade delete).
  - `V7__seed_roadmap.sql` seeding all 18 DSA roadmap phases and patterns.
  - `V8__seed_initial_problems.sql` seeding initial 4 solved problems and metadata.
- Configured local gradle wrapper to resolve using cached local zip file `file:///d:/gradle-8.5-bin.zip` to bypass redirect and connection timeouts.
- Set up `application.yml` with PostgreSQL datasource properties and `ddl-auto=none` for initial bootstrapping.

### Changed
- Refined database UUID strings in seeds (`V7` and `V8`) to use valid hexadecimal values (replacing `'p0a00000'`, `'m0a00000'`, and `'r0a00000'` patterns which failed PostgreSQL syntax parsing).
- Fixed Flyway dependency mapping in `build.gradle` by explicitly assigning version `10.10.0` for `flyway-core` and `flyway-database-postgresql` when mapping outside the default BOM.

### Verified
- Launched PostgreSQL container via Docker Compose.
- Successfully built compiled executable JAR via Gradle.
- Successfully booted Spring Boot application directly, applying all 8 Flyway migrations on the database without errors.
- Verified Vite frontend dev server starts successfully.
