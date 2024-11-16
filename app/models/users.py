from sqlmodel import Field, SQLModel, Column
from enum import Enum as TypeEnum
from sqlmodel import Enum as DatabaseEnum

class User(SQLModel, table = True):
    """
    This is the table representation for the Observation entity, it includes
    all fields from the base class and our auto increment ID.
    """
    user_name : str
    password : str
    id: int | None = Field(default=None, primary_key=True)
    

class CreateUser(User):
    user_name : str
    password : str

    pass