USE ai_impact_project;

CREATE TABLE ai_jobs (
  job_id VARCHAR(50),
  posting_year INT,
  country VARCHAR(100),
  region VARCHAR(100),
  city VARCHAR(100),
  company_name VARCHAR(255),
  company_size VARCHAR(50),
  industry VARCHAR(100),
  job_title VARCHAR(255),
  seniority_level VARCHAR(100),
  ai_mentioned VARCHAR(10),
  ai_keywords TEXT,
  ai_intensity_score DECIMAL(5,3),
  core_skills TEXT,
  ai_skills TEXT,
  salary_usd DECIMAL(12,2),
  salary_change_vs_prev_year_percent DECIMAL(6,2),
  automation_risk_score DECIMAL(5,3),
  reskilling_required VARCHAR(10),
  ai_job_displacement_risk VARCHAR(50),
  job_description_embedding_cluster INT,
  industry_ai_adoption_stage VARCHAR(100)
);
