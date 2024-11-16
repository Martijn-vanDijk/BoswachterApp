from fastapi import FastAPI
from app.dependencies.database import create_db_and_tables
from app.routers import observations
from app.routers import users
api = FastAPI()
api.include_router(observations.router)
api.include_router(users.router)

def validate_user(name : str, password : str):
    return __get_user(name, password)