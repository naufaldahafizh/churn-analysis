# src/load_data.py
import pandas as pd
from sqlalchemy import create_engine

def load_churn_data(host='localhost', port=5432, user='ds_user', password='user', db='telco_db'):
    """
    Menghubungkan ke PostgreSQL dan mengambil seluruh isi tabel telco.churn
    """
    # Connection string SQLAlchemy
    conn_string = f'postgresql+psycopg2://{user}:{password}@{host}:{port}/{db}'
    engine = create_engine(conn_string)
    
    # Ambil data
    query = "SELECT * FROM telco.churn;"
    df = pd.read_sql(query, engine)
    engine.dispose()
    return df

if __name__ == "__main__":
    df = load_churn_data()
    print("Data berhasil di-load, shape:", df.shape)
