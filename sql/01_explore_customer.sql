-- 01_explore_customers.sql
-- 1. Hitung total pelanggan dan churn rate
SELECT
  COUNT(*) AS total_customers,
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)::FLOAT / COUNT(*) AS churn_rate
FROM telco.churn;

-- 2. Rata-rata churn per gender
SELECT churn, AVG(tenure) AS avg_tenure
FROM telco.churn
GROUP BY churn;

-- 3. Distribusi payment method
SELECT PaymentMethod, COUNT(*) AS count_customers
FROM telco.churn
GROUP BY PaymentMethod
ORDER BY count_customers DESC;

--4. Distribusi contract per gender dari yang terbesar
SELECT Contract, gender, COUNT(*) AS count_customers
FROM telco.churn
GROUP BY Contract, gender
ORDER BY count_customers DESC;

--5. Rata-rata Monthly Charges pada customer yang churn
SELECT churn, AVG(MonthlyCharges) AS avg_monthlyCharges
FROM telco.churn
GROUP BY churn;

--6. Rata-rata tenure per contract
SELECT Contract, AVG(tenure) AS avg_tenure
FROM telco.churn
GROUP BY Contract
ORDER BY avg_tenure;