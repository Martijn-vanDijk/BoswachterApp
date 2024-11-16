from fastapi import HTTPException, Query, APIRouter
from app.models.users import *
from sqlmodel import select, Session
from app.dependencies.database import engine, add_to_session
from typing import Annotated

router = APIRouter(
    prefix="/users",
    tags=["users"],
)

# @router.post("/Register", status_code=201)
# def __make_user(user : CreateUser) -> User:
#     with Session(engine) as session:
#         db_users = User.model_validate(user)
#         add_to_session(db_users, session)
#         return db_users
#         db_observation = Observation.model_validate(observation)
#         add_to_session(db_observation, session)
#         return db_observation

@router.post("/", status_code=201)
def __post_user(user: CreateUser) -> User:
    with Session(engine) as session:
        db_users = Observation.model_validate(user)
        add_to_session(db_users, session)
        return db_users

@router.get("/")
def __get_users(
    offset: int = 0,
    limit: Annotated[int, Query(le=100)] = 100,
) -> list[User]:
    with Session(engine) as session:
        users = session.exec(select(User).offset(offset).limit(limit)).all()
        return users

@router.get("/{id}")
def __get_user(id: int) -> User:
    with Session(engine) as session:
        return __require_user(id, session)

# @router.get("/user")
# def __get_user(name: str, password: str):
#     with Session(engine) as session:
#         IsUser = False
#         if (User.user_name == name) and (User.password == password):
#             IsUser = True
        
#         return IsUser
        