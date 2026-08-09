# DSA Journey — Personal Java + DSA Placement Tracker

DSA Journey is a full-stack personal tracking dashboard and preparation roadmap designed to help you structure, practice, revise, and master Java-based Data Structures and Algorithms for placement interviews.

---

## 🚀 Key Features

* **Interactive Roadmap**: A tier-based roadmap mapping 18 distinct preparation phases.
* **Practice Logging**: Log solved LeetCode problems with step-by-step intuition, code snippets, and complexity analyses.
* **Spaced Repetition Engine**: Automatically schedules 1-day, 7-day, and 30-day revision checkpoints when status is marked as `REVISION_SCHEDULED`. Promotions to `MASTERED` occur automatically once all three review cycles are completed.
* **Mistake Bank**: A centralized hub documenting incorrect misconceptions, correct understandings, and resolutions by pattern.
* **Readiness Meter**: Renders topic-level preparation percentages (requires 3 logged problems per topic to reach 100% phase readiness).
* **Analytics**: Charts preparation rates, LeetCode difficulty breakdowns, and mistake resolution metrics.
* **JWT Security**: Secures practice records, statistics, and logs per user account.

---

## 🛠️ Tech Stack

### Backend
* **Language/Framework**: Java 21 LTS, Spring Boot 3.x (Web, JPA, Security)
* **Authentication**: Stateless JWT Bearer Security (JJWT 0.12.x)
* **Database**: PostgreSQL 15, Flyway Schema Migrations
* **Build System**: Gradle

### Frontend
* **Core**: React, Vite, TypeScript
* **State Management & Forms**: TanStack Query (React Query), React Hook Form, Zod
* **Styling**: Premium Custom Vanilla CSS (Dark Mode, Glassmorphic Panels, Dynamic Animations)

---

## ⚡ Running Locally

### Prerequisites
1. **Docker Desktop** (for running PostgreSQL container)
2. **Java 21 JDK**
3. **Node.js LTS** (version 20+)

### Step 1: Start Database Container
At the root directory, run the database container:
```bash
docker compose up -d postgres
```
This spins up a PostgreSQL server on port `5432` and applies all Flyway migrations automatically.

### Step 2: Start Spring Boot Backend
Navigate to the `/backend` folder:
```bash
cd backend
./gradlew bootRun
```
The server will boot up on port `8080`.

### Step 3: Start Vite Frontend
Navigate to the `/frontend` folder:
```bash
cd frontend
npm install
npm run dev
```
Open [http://localhost:5173](http://localhost:5173) in your browser.

* **Seeded Credentials**:
  * Username: `demo_user`
  * Password: `password123`

---

## 🐳 Docker Production Deployment

To package and run the entire application stack in isolated Docker containers:

1. Build and run containers at the root directory:
   ```bash
   docker compose up --build -d
   ```
2. The services will bind:
   * PostgreSQL on port `5432`
   * Spring Boot REST API on port `8080`
3. Run Vite production server locally, which communicates with the dockerized backend on `http://localhost:8080`.
