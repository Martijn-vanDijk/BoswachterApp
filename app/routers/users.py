from fastapi import HTTPException, Query, APIRouter
from app.models.users import *
from sqlmodel import select, Session
from app.dependencies.database import engine, add_to_session
from typing import Annotated

router = APIRouter(
    prefix="/users",
    tags=["users"],
)

@router.post("/Register", status_code=201)
def __make_user(user : CreateUser) -> User:
    with Session(engine) as session:
        db_users = User.model_validate(user)
        add_to_session(db_users, session)
        return db_users
        db_observation = Observation.model_validate(observation)
        add_to_session(db_observation, session)
        return db_observation
    
@router.get("/user")
def __get_user(name: str, password: str):
    with Session(engine) as session:
        IsUser = False
        if (User.user_name == name) and (User.password == password):
            IsUser = True
        
        return IsUser
        