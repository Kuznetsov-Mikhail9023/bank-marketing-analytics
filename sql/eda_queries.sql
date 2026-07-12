
-- ====================================================================
-- PROJECT: Bank Marketing Campaign - Exploratory Data Analysis (EDA)
-- AUTHOR: Mykhailo Kuznetsov
-- DB ENGINE: PostgreSQL
-- ====================================================================

-- Analysis of campaign efficiency and spam factor
SELECT
    campaign,
    COUNT(*) AS total_calls,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS successful_calls,
    ROUND((SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS conversion_rate
FROM bank_marketing
GROUP BY campaign
ORDER BY campaign ASC;


-- Analysis of historical contact outcomes
SELECT
    poutcome AS past_contact_outcome,
    COUNT(*) AS total_calls,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS successful_calls,
    ROUND((SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS conversion_rate
FROM bank_marketing
GROUP BY poutcome
ORDER BY conversion_rate DESC;


-- Seasonality analysis by month
SELECT
    month,
    COUNT(*) AS total_calls,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS successful_calls,
    ROUND((SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS conversion_rate
FROM bank_marketing
GROUP BY month
ORDER BY to_date(month, 'Mon') ASC;


-- Customer profiling by profession / job type
SELECT
    job,
    COUNT(*) AS total_calls,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS successful_calls,
    ROUND((SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS conversion_rate
FROM bank_marketing
GROUP BY job
ORDER BY conversion_rate DESC;


-- Customer profiling by age groups
SELECT
    CASE 
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 39 THEN '25-39'
        WHEN age BETWEEN 40 AND 59 THEN '40-59'
        ELSE '60 and older'
    END AS age_group,
    COUNT(*) AS total_calls,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS successful_calls,
    ROUND((SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS conversion_rate
    
FROM bank_marketing
GROUP BY age_group
ORDER BY conversion_rate DESC;


-- Customer profiling by marital status
SELECT
    marital AS marital_status,
    COUNT(*) AS total_calls,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS successful_calls,
    ROUND((SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS conversion_rate
FROM bank_marketing
GROUP BY marital
ORDER BY conversion_rate DESC;


-- Customer profiling by education level
SELECT
    education AS education_level,
    COUNT(*) AS total_calls,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS successful_calls,
    ROUND((SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS conversion_rate
FROM bank_marketing
GROUP BY education
ORDER BY conversion_rate DESC;


-- Impact of the 3-month Euribor interest rate
SELECT
    ROUND(euribor3m::numeric, 0) AS rounded_euribor,
    COUNT(*) AS total_calls,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS successful_calls,
    ROUND((SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS conversion_rate
FROM bank_marketing
GROUP BY ROUND(euribor3m::numeric, 0)
ORDER BY rounded_euribor ASC;


-- Impact of the Consumer Price Index (Inflation Rate)
SELECT
    ROUND("cons.price.idx"::numeric, 0) AS inflation_rate,
    COUNT(*) AS total_calls,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS successful_calls,
    ROUND((SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS conversion_rate
FROM bank_marketing
GROUP BY ROUND("cons.price.idx"::numeric, 0)
ORDER BY inflation_rate ASC;


-- Impact of the Consumer Confidence Index
SELECT
    ROUND("cons.conf.idx"::numeric, 0) AS confidence_rate,
    COUNT(*) AS total_calls,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS successful_calls,
    ROUND((SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS conversion_rate
FROM bank_marketing
GROUP BY confidence_rate
ORDER BY confidence_rate ASC;

