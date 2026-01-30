-- D1 Database Schema for LXCheck Results
-- This schema stores student workshop test results submitted by lxcheck

CREATE TABLE IF NOT EXISTS results (
  id TEXT PRIMARY KEY,
  student_account TEXT NOT NULL,
  workshop_id TEXT NOT NULL,
  workshop_title TEXT,
  total_checks INTEGER NOT NULL,
  passed_checks INTEGER NOT NULL,
  results_json TEXT NOT NULL,
  timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
  ip_address TEXT,
  hostname TEXT
);

-- Indexes for common query patterns
CREATE INDEX IF NOT EXISTS idx_student ON results(student_account);
CREATE INDEX IF NOT EXISTS idx_workshop ON results(workshop_id);
CREATE INDEX IF NOT EXISTS idx_timestamp ON results(timestamp DESC);
CREATE INDEX IF NOT EXISTS idx_student_workshop ON results(student_account, workshop_id);

-- Optional: Create a view for summary statistics
CREATE VIEW IF NOT EXISTS result_summary AS
SELECT 
  student_account,
  workshop_id,
  COUNT(*) as attempt_count,
  MAX(passed_checks) as best_score,
  MAX(timestamp) as last_attempt
FROM results
GROUP BY student_account, workshop_id;
