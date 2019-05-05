#!/bin/bash
# CREACIÓ DEL SERVEI
docker service create \
--replicas 3 \
--name "apache-php" \
-p 80:80 \
nandrade/php-apache

# ROLLING UPDATE

docker service update apache-php

# LISTA DE SERVICIOS
docker service ls

