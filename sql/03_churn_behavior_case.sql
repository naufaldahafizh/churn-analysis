-- Distribusi perilaku pelanggan berdasarkan status churn

-- 1. Rata-rata tenure dan biaya berdasarkan status churn
SELECT
    churn,
    ROUND(AVG(tenure), 2) AS avg_tenure,
    ROUND(AVG(monthlycharges), 2) AS avg_monthlycharges,
    ROUND(AVG(totalcharges::numeric), 2) AS avg_totalcharges
FROM
    telco.churn
GROUP BY
    churn;

-- 2. Window function: ranking biaya bulanan per contract group
SELECT
    customerid,
    contract,
    monthlycharges,
    RANK() OVER (PARTITION BY contract ORDER BY monthlycharges DESC) AS charge_rank
FROM
    telco.churn
LIMIT 20;

-- 3. CASE WHEN: segmentasi risiko churn berdasarkan profil pembayaran
SELECT
    customerid,
    tenure,
    monthlycharges,
    paymentmethod,
    churn,
    CASE
        WHEN monthlycharges >= 90 THEN 'High Risk'
        WHEN monthlycharges BETWEEN 60 AND 89 THEN 'Moderate Risk'
        ELSE 'Low Risk'
    END AS risk_segment
FROM
    telco.churn
WHERE
    churn = 'Yes'
ORDER BY
    monthlycharges DESC
LIMIT 50;
