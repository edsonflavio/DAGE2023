#!/bin/bash
#Executando o container do BD
docker run --name db \
    -e POSTGRES_PASSWORD=postgres \
    -e POSTGRES_USER=postgres -d \
    postgis/postgis:15-3.3
#Executando o container da API
docker run --name api \
    -dit -p 8080:8050 \
    --name api -v $PWD:/code \
    restgeoapi
#Executando o container do PGAdmin
docker run -d -p 8000:80 \
    -e PGADMIN_DEFAULT_EMAIL=edson.flavio@ufpr.br \
    -e PGADMIN_DEFAULT_PASSWORD=*Admin* \
    --name pgadmin \
    dpage/pgadmin4
