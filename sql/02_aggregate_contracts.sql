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
    COUNT(*) AS count_customers
FROM
    telco.churn
GROUP BY
    contract, paymentmethod
ORDER BY
    contract, count_customers DESC;
