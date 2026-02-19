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


# Dividing AI intensity into groups and finding average salary of each group

SELECT
    CASE
        WHEN ai_intensity_score < 0.2 THEN 'Very Low'
        WHEN ai_intensity_score < 0.3 THEN 'Low'
        WHEN ai_intensity_score < 0.4 THEN 'Medium'
        WHEN ai_intensity_score < 0.5 THEN 'High'
        ELSE 'Very High'
    END AS ai_band,
    ROUND(AVG(salary_usd), 2) AS avg_salary,
    COUNT(*) AS job_count
FROM ai_jobs
GROUP BY ai_band
ORDER BY avg_salary;


# Comparing salary by AI intensity across industries

SELECT
    industry,
    CASE
        WHEN ai_intensity_score < 0.2 THEN 'Very Low'
        WHEN ai_intensity_score < 0.3 THEN 'Low'
        WHEN ai_intensity_score < 0.4 THEN 'Medium'
        WHEN ai_intensity_score < 0.5 THEN 'High'
        ELSE 'Very High'
    END AS ai_band,
    ROUND(AVG(salary_usd), 2) AS avg_salary,
    COUNT(*) AS job_count
FROM ai_jobs
GROUP BY industry, ai_band
ORDER BY industry, avg_salary;


# AI intensity and salary by seniority level.

SELECT
    seniority_level,
    CASE
        WHEN ai_intensity_score < 0.2 THEN 'Very Low'
        WHEN ai_intensity_score < 0.3 THEN 'Low'
        WHEN ai_intensity_score < 0.4 THEN 'Medium'
        WHEN ai_intensity_score < 0.5 THEN 'High'
        ELSE 'Very High'
    END AS ai_band,
    ROUND(AVG(salary_usd), 2) AS avg_salary,
    COUNT(*) AS job_count
FROM ai_jobs
GROUP BY seniority_level, ai_band
ORDER BY seniority_level, avg_salary;

