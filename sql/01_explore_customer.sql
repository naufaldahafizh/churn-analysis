-- 01_explore_customers.sql
-- 1. Hitung total pelanggan dan churn rate
SELECT
  COUNT(*) AS total_customers,
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)::FLOAT / COUNT(*) AS churn_rate
FROM telco.churn;

-- 2. Rata-rata tenure per gender
SELECT gender, AVG(tenure) AS avg_tenure
FROM telco.churn
GROUP BY gender;

-- 3. Distribusi payment method
SELECT PaymentMethod, COUNT(*) AS count_customers
FROM telco.churn
GROUP BY PaymentMethod
ORDER BY count_customers DESC;
