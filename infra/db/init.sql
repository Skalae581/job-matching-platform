CREATE SCHEMA IF NOT EXISTS app;

CREATE TABLE IF NOT EXISTS app.candidate (
  id BIGSERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  location TEXT,
  target_role TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS app.candidate_skill (
  candidate_id BIGINT NOT NULL REFERENCES app.candidate(id) ON DELETE CASCADE,
  skill TEXT NOT NULL,
  level TEXT,
  PRIMARY KEY (candidate_id, skill)
);

CREATE TABLE IF NOT EXISTS app.job (
  id BIGSERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  company TEXT,
  location TEXT,
  description TEXT,
  source TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS app.job_skill (
  job_id BIGINT NOT NULL REFERENCES app.job(id) ON DELETE CASCADE,
  skill TEXT NOT NULL,
  PRIMARY KEY (job_id, skill)
);

CREATE TABLE IF NOT EXISTS app.match_result (
  candidate_id BIGINT NOT NULL REFERENCES app.candidate(id) ON DELETE CASCADE,
  job_id BIGINT NOT NULL REFERENCES app.job(id) ON DELETE CASCADE,
  score DOUBLE PRECISION NOT NULL,
  explanation_json JSONB,
  created_at TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY (candidate_id, job_id)
);
