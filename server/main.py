from fastapi import FastAPI
from server.routes import auth


app = FastAPI()
app.include_router(auth.router, prefix="/auth")