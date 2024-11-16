from fastapi import HTTPException, Query, APIRouter
from app.models.users import *
from sqlmodel import select, Session
from app.dependencies.database import engine, add_to_session
from typing import Annotated

from fastapi import HTTPException, Query, APIRouter
from app.models.users import *
from sqlmodel import select, Session
from app.dependencies.database import engine, add_to_session
from typing import Annotated

router = APIRouter(
    prefix="/users",
    tags=["users"],
)

@router.post("/Register")
def __make_user(name: str, password :str):
    with Session(engine) as session:
        User.user_name = name
        User.password = password
        return "Success"
    
@router.get("/user")
def __get_user(name: str, password: str):
    with Session(engine) as session:
        IsUser = False
        if (User.user_name == name) and (User.password == password):
            IsUser = True
        
        return IsUser
        