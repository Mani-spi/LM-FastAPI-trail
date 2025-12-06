
from fastapi import FastAPI
from .routers import users
from .database import engine, Base
import contextlib

@contextlib.asynccontextmanager
async def lifespan(app: FastAPI):
    # Startup: could create tables if not exists (usually handled by alembic)
    # async with engine.begin() as conn:
    #     await conn.run_sync(Base.metadata.create_all)
    yield
    # Shutdown
    await engine.dispose()

app = FastAPI(
    title="Hostinger FastAPI Demo",
    lifespan=lifespan
)

app.include_router(users.router)

@app.get("/")
async def root():
    return {"message": "Hello from Hostinger deployment!"}
