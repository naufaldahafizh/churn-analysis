-- Rata-rata tenure dan monthly charges per contract type
SELECT contract, AVG(tenure) as avg_tenure, AVG(MonthlyCharges) as avg_monthly
FROM telco
GROUP BY contract;
