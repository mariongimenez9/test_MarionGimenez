#!/bin/bash

read -p "Entrez le mode de lancement désiré pour votre container Docker -d (Deamon) -it (interactif)" mode
read -p "Renseignez l'environnement PROD/DEV:" env

sudo docker build -t mariong/test .
sudo docker run $mode --name test -p 8080:80 -v $PWD:/data --privileged=true mariong/test:latest sh /data/tomcat_test.sh $env
sudo docker ps -a
