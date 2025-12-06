
from pydantic import BaseModel, EmailStr, ConfigDict
from datetime import datetime
from typing import Optional

# Base Schema
class UserBase(BaseModel):
    username: str
    email: EmailStr
    is_active: bool = True

# Schema for creating a user
class UserCreate(UserBase):
    password: str

# Schema for updating a user
class UserUpdate(BaseModel):
    username: Optional[str] = None
    email: Optional[EmailStr] = None
    password: Optional[str] = None
    is_active: Optional[bool] = None

# Schema for reading a user (Response)
class UserResponse(UserBase):
    id: int
    created_at: Optional[datetime] = None
    updated_at: Optional[datetime] = None

    model_config = ConfigDict(from_attributes=True)
