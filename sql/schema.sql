-- schema.sql
CREATE SCHEMA IF NOT EXISTS telco;

CREATE TABLE telco.churn (
  customerID          VARCHAR(50) PRIMARY KEY,
  gender              VARCHAR(10),
  SeniorCitizen       INTEGER,
  Partner             VARCHAR(3),
  Dependents          VARCHAR(3),
  tenure              INTEGER,
  PhoneService        VARCHAR(3),
  MultipleLines       VARCHAR(20),
  InternetService     VARCHAR(20),
  OnlineSecurity      VARCHAR(20),
  OnlineBackup        VARCHAR(20),
  DeviceProtection    VARCHAR(20),
  TechSupport         VARCHAR(20),
  StreamingTV         VARCHAR(20),
  StreamingMovies     VARCHAR(20),
  Contract            VARCHAR(20),
  PaperlessBilling    VARCHAR(3),
  PaymentMethod       VARCHAR(50),
  MonthlyCharges      NUMERIC,
  TotalCharges        NUMERIC,
  churn               VARCHAR(3)
);
