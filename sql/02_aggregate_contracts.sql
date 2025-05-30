-- Aggregate jumlah pelanggan dan rata-rata durasi berdasarkan jenis kontrak
SELECT
    contract,
    COUNT(*) AS total_customers,
    ROUND(AVG(tenure), 2) AS avg_tenure,
    ROUND(AVG(monthlycharges), 2) AS avg_monthlycharges
FROM
    telco.churn
GROUP BY
    contract
ORDER BY
    total_customers DESC;

-- Kategori kontrak dengan payment method untuk melihat distribusi metode pembayaran
SELECT
    contract,
    paymentmethod,
    COUNT(*) AS total_customers
FROM
    telco.churn
GROUP BY
    contract, paymentmethod
ORDER BY
    contract, total_customers DESC;

-- Agregate persentase churn dan total charges berdasarkan jenis kontrak
SELECT
    contract,
    ROUND((SUM(CASE WHEN churn= 'Yes' THEN 1 ELSE 0 END)::NUMERIC / COUNT(*)), 2) AS churn_rate,
    ROUND(AVG(totalcharges), 2) AS avg_totalcharges
FROM
    telco.churn
GROUP BY 
    contract
ORDER BY
    churn_rate DESC;
