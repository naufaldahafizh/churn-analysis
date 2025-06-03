# Customer Churn Analysis

## Deskripsi
Analisis ini bertujuan untuk menganalisis perilaku customer churn hingga prediksi kemungkinan churn

## Data & Sumber
- Sumber Data: https://www.kaggle.com/datasets/blastchar/telco-customer-churn 
- Dataset: Telco Customer Churn (7043 baris, 21 kolom)
- SQL schema & query:
  - '00_schema.sql': Definisi tabel
  - '01_explore_customer.sql': Eksplorasi karakteristik customer
  - '02_aggregate_contracts.sql': Agregasi per jenis kontrak
  - '03_churn_behavior_case.sql': Analisis churn behavior dengan window functions

## Metodologi
1. **Load Dataset**: 'src/load_data.py'
2. **Exploratory Data Analysis**: 'notebooks/01_eda_modeling.ipynb'
3. **& Data Cleaning & Feature Engineering**: 'src/preprocessing.py'
4. **Modeling**: Logistic Regression, Random Forest
5. **Evaluasi**: Classification Report, Feature Importance, ROC Curve
6. **Dokumentasi & Visualisasi**: 'data/churn_predictions.csv'  → di‐import ke SQL untuk analisis lebih lanjut

## Hasil Utama
- Pelanggan dengan kontrak **Month‐to‐month** lebih rentan churn.
- Pelanggan dengan **MonthlyCharges** tinggi & **tenure** rendah punya probabilitas churn besar.
- Segmentasi risiko (Bisa ditentukan berdasarkan nilai fitur atau probabilitas prediksi churn)


## Reproduksi
```bash
git clone https://github.com/naufaldahafizh/churn-analysis.git
cd churn-analysis
pip install -r requirements.txt
jupyter notebook notebooks/01_eda_modeling.ipynb
```