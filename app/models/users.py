from sqlmodel import Field, SQLModel, Column
from enum import Enum as TypeEnum
from sqlmodel import Enum as DatabaseEnum

class ObservationBase(SQLModel):
    """
    This is the base class for Observation entities containing all fields the
    user can set.
    """
    user_name : str
    password : str
    
class Observation(ObservationBase, table=True):
    """
    This is the table representation for the Observation entity, it includes
    all fields from the base class and our auto increment ID.
    """
    id: int | None = Field(default=None, primary_key=True)