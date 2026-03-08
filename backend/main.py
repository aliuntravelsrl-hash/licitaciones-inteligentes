from fastapi import FastAPI

app = FastAPI(title="LicitIA API")

@app.get("/")
def root():
    return {"message": "Bienvenido a la API de LicitIA"}
