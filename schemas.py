from pydantic import BaseModel, EmailStr, ConfigDict
from datetime import datetime
from typing import Optional

# Base Schema
class UserBase(BaseModel):
    email: EmailStr
    is_active: bool = True

# Schema for creating a user
class UserCreate(UserBase):
    password: str

# Schema for reading a user (returning response)
class UserResponse(UserBase):
    id: int
    created_at: datetime
    updated_at: Optional[datetime] = None

    model_config = ConfigDict(from_attributes=True)
