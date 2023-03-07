#!/bin/bash

# Definir el nombre del contenedor
CONTAINER_NAME="bootcamp-web"

# Verificar si el contenedor ya existe
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "El contenedor $CONTAINER_NAME ya existe."
    exit 1
fi

# Verificar si la carpeta web existe
if [ ! -d "web" ]; then
    echo "La carpeta web no existe."
    exit 1
fi

# Crear el contenedor Nginx y copiar los archivos web
docker run -d --name $CONTAINER_NAME -p 9999:80 -v $(pwd)/web:/usr/share/nginx/html:ro nginx

# Verificar que los archivos se han copiado correctamente
docker exec $CONTAINER_NAME ls /usr/share/nginx/html

# Mostrar el mensaje de Hola desde el contenedor de nginx
echo "Puedes ver el mensaje de Hola desde el contenedor de nginx accediendo a http://localhost:9999 en tu navegador."