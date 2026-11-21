#!/bin/bash

IMAGE_NAME="mon-app-flask"
CONTAINER_NAME="conteneur-flask"

echo "1. Arrêt et suppression de l'ancien conteneur (s'il existe)..."
docker stop $CONTAINER_NAME 2>/dev/null
docker rm $CONTAINER_NAME 2>/dev/null

echo "2. Construction de l'image Docker..."
docker build -t $IMAGE_NAME .

echo "3. Lancement du conteneur sur le port 5000..."
docker run -d -p 5000:5000 --name $CONTAINER_NAME $IMAGE_NAME

echo "4. État du conteneur :"
docker ps -f name=$CONTAINER_NAME
