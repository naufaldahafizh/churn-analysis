# src/preprocessing.py
import pandas as pd
import numpy as np
from sklearn.preprocessing import LabelEncoder, OneHotEncoder, StandardScaler
from load_data import load_churn_data

def basic_clean(df):
    """
    - Ubah TotalCharges menjadi numerik (kosong→NaN)
    - Drop row yang missing di kolom krusial
    - Ubah SeniorCitizen ke kategori
    """
    # Ubah string kosong di kolom TotalCharges jadi NaN, lalu numeric (jika belum diatasi oleh SQL)
    df['TotalCharges'] = pd.to_numeric(df['TotalCharges'], errors='coerce')
    
    # Drop jika ada missing setelah konversi
    df = df.dropna(subset=['TotalCharges'])
    
    # Ubah SeniorCitizen (0/1) ke tipe data kategori
    df.loc[:, 'SeniorCitizen'] = df['SeniorCitizen'].astype('category')
    
    return df

def encode_features(df):
    """
    - Ubah kolom-kolom kategori ke numerik dengan one-hot encoding.
    - Return DataFrame baru dengan fitur siap untuk tahap modeling.
    """
    # Daftar kolom kategori yang ingin di‐label‐encode (ordinal)
    ordinal_cols = ['Contract']
    
    # LabelEncoder untuk ordinal
    le = LabelEncoder()
    for col in ordinal_cols:
        df[col] = le.fit_transform(df[col])
    
    # Kolom kategorikal lain kita one-hot encode
    onehot_cols = ['gender', 'Partner', 'Dependents', 'PhoneService', 'MultipleLines',
                   'InternetService', 'OnlineSecurity', 'OnlineBackup', 'DeviceProtection',
                   'TechSupport', 'StreamingTV', 'StreamingMovies', 'PaperlessBilling', 'PaymentMethod']
    
    df = pd.get_dummies(df, columns=onehot_cols, drop_first=True)
    
    # Ubah data churn (Yes/No) ke biner (1/0)
    df['ChurnFlag'] = df['Churn'].map({'Yes': 1, 'No': 0})
    df = df.drop(columns=['Churn', 'customerID'])
    
    return df

def scale_numeric(df):
    """
    - Standardisasi kolom numerik (tenure, MonthlyCharges, TotalCharges)
    """
    scaler = StandardScaler()
    num_cols = ['tenure', 'MonthlyCharges', 'TotalCharges']
    df[num_cols] = scaler.fit_transform(df[num_cols])
    return df

if __name__ == "__main__":
    data = load_churn_data()
    data = basic_clean(data)
    data_encoded = encode_features(data.copy())
    data_scaled = scale_numeric(data_encoded.copy())
    print("Selesai tahap preprocessing. Shape akhir:", data_scaled.shape)
