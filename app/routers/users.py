from fastapi import HTTPException, Query, APIRouter
from app.models.observation import *
from sqlmodel import select, Session
from app.dependencies.database import engine, add_to_session
from typing import Annotated

router = APIRouter(
    prefix="/users",
    tags=["users"],
)

@router.get("/User")
def __get_user(name: str, password :str):
    with Session(engine) as session:
        return __require_observation(id, session)