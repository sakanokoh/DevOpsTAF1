# Gestion des Étudiants avec FastAPI et MySQL

## Description

Ce projet propose une API REST développée avec FastAPI et MySQL, permettant de réaliser des opérations CRUD (Create, Read, Update, Delete) sur des étudiants. L'API expose des endpoints pour ajouter, consulter, mettre à jour et supprimer des étudiants dans une base de données MySQL.

## Fonctionnalités

- **Création d'un étudiant** : Ajouter un nouvel étudiant dans la base de données.
- **Consultation des étudiants** : Récupérer la liste complète des étudiants ou un étudiant spécifique par son ID.
- **Mise à jour d'un étudiant** : Modifier les informations d'un étudiant existant.
- **Suppression d'un étudiant** : Supprimer un étudiant en fonction de son ID.

## Prérequis

- **Python** 3.9 ou une version plus récente.
- **Docker** (fortement recommandé pour gérer MySQL et FastAPI via des conteneurs).

## Installation

### Étapes pour installer et configurer le projet :

1. **Cloner le projet** :
   ```bash
   git clone https://github.com/sakanokoh/DevOpsTAF1.git
   cd DevOpsTAF1
   ```

### Choix de la méthode d'installation

Vous avez deux options pour exécuter l'application : soit via Docker directement, soit en utilisant `docker-compose`.

> ### Option 1 : Utilisation de Docker uniquement

1. **Lancer le conteneur MySQL** :

   Nous allons créer un conteneur pour la base de données MySQL en utilisant la dernière version officielle de l'image MySQL. Exécutez la commande suivante :

   ```bash
   docker run -d \
     --name databasetaf1 \
     --network app-network \
     -e MYSQL_ROOT_PASSWORD=rootpassword \
     -e MYSQL_USER=myuser \
     -e MYSQL_PASSWORD=mypassword \
     -e MYSQL_DATABASE=studentdb \
     -v db_data:/var/lib/mysql \
     -p 3307:3306 \
     mysql
   ```

2. **Lancer le conteneur FastAPI** :

   Ensuite, vous devez créer et exécuter le conteneur pour FastAPI en utilisant l'image Docker personnalisée que vous avez construite.

   Ici on va utiliser l'image que l'on a construit avec la commande suivante (le fichier `Dockerfile` se trouve à la racine du projet) :

   ```bash
   docker build -t hamsak/backendtaf1:v1.0.0 .
   ```

   **NB** : L'image existe déjà sur Docker Hub, vous pouvez la récupérer avec cette commande :

   ```bash
   docker pull hamsak/backendtaf1:v1.0.0
   ```

   Une fois l'image prête, lancez le conteneur FastAPI avec cette commande :

   ```bash
   docker run -d \
     --name fastapi_backend \
     --network app-network \
     -e MYSQL_USER=myuser \
     -e MYSQL_PASSWORD=mypassword \
     -e MYSQL_DATABASE=studentdb \
     -e MYSQL_HOST=databasetaf1 \
     -p 8000:8000 \
     hamsak/backendtaf1:v1.0.0
   ```

   **Remarque** : Vous n'avez pas besoin d'exécuter `docker pull` si l'image n'existe pas localement. Docker la télécharge automatiquement lors de l'exécution de `docker run`.

> ### Option 2 : Utilisation de Docker Compose

La manière la plus simple de configurer et d'exécuter les deux conteneurs (MySQL et FastAPI) est d'utiliser `docker-compose`. Cela vous permet de gérer l'ensemble du projet avec une seule commande :

```bash
docker-compose up -d
```

Cela démarre à la fois la base de données MySQL et le backend FastAPI dans un réseau Docker commun.

## Accéder aux Endpoints

Une fois que l'application est démarrée, vous pouvez accéder aux différents endpoints de l'API en utilisant les URLs suivantes :

- URL : `http://localhost:8000/` Pour voir un message de bienvenu et quelques infos sur le projet

1. **Documentation interactive de l'API** (fourni par FastAPI via Swagger) :
   - URL : `http://localhost:8000/docs`
   
2. **Endpoints CRUD pour les étudiants** :
   - **GET** `/students/` : Récupérer la liste de tous les étudiants.
   - **GET** `/students/{id}` : Récupérer un étudiant spécifique par son ID.
   - **POST** `/students/` : Créer un nouvel étudiant.
   - **DELETE** `/students/{id}` : Supprimer un étudiant par son ID.



## Auteur

- **Hamady SAKANOKO** - Développeur principal - [Profil](https://github.com/sakanokoh)

---
