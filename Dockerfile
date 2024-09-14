# Utiliser l'image Python
FROM python:3.9

# Définir le répertoire de travail
WORKDIR /code

# Copy requirements file
COPY ./requirements.txt /code/requirements.txt

# Installer les dépendances
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copier les fichiers de l'application
COPY ./app /code/app


# Exposer le port
EXPOSE 8000

# Lancer l'application FastAPI
CMD ["uvicorn", "app.app:app", "--host", "0.0.0.0", "--port", "8000"]
