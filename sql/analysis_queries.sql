# Average AI intensity by industry

SELECT 
    industry,
    ROUND(AVG(ai_intensity_score), 3) AS avg_ai_intensity,
    COUNT(*) AS job_count
FROM ai_jobs
WHERE ai_intensity_score IS NOT NULL
GROUP BY industry
ORDER BY avg_ai_intensity DESC;


# Average salary by industry

SELECT 
    industry,
    ROUND(AVG(salary_usd), 2) AS avg_salary,
    COUNT(*) AS job_count
FROM ai_jobs
WHERE salary_usd IS NOT NULL
GROUP BY industry
ORDER BY avg_salary DESC;


# Overall average AI intensity

SELECT AVG(ai_intensity_score) AS overall_avg_ai
FROM ai_jobs;


# High AI salary average

SELECT 
    ROUND(AVG(salary_usd), 2) AS avg_salary_high_ai,
    COUNT(*) AS job_count
FROM ai_jobs
WHERE ai_intensity_score >= 0.2873;


# Low AI salary average

SELECT 
    ROUND(AVG(salary_usd), 2) AS avg_salary_low_ai,
    COUNT(*) AS job_count
FROM ai_jobs
WHERE ai_intensity_score < 0.2873;
