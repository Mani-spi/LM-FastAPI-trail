import os
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base
from dotenv import load_dotenv

load_dotenv()

MYSQL_USER = os.getenv("MYSQL_USER", "user_1")
MYSQL_PASSWORD = os.getenv("MYSQL_PASSWORD", "password_1")
MYSQL_DB = os.getenv("MYSQL_DB", "lm_fastapi_db_1")
MYSQL_HOST = os.getenv("MYSQL_HOST", "db_1")

DATABASE_URL = f"mysql+pymysql://{MYSQL_USER}:{MYSQL_PASSWORD}@{MYSQL_HOST}/{MYSQL_DB}"

engine = create_engine(DATABASE_URL, pool_pre_ping=True)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()
