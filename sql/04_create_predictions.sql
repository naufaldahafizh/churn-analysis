-- 04_create_predictions.sql
CREATE TABLE telco.churn_predictions (
    customerID VARCHAR(50) PRIMARY KEY,
    proba_churn NUMERIC,
    pred_churn INTEGER
);
