# Script        : Dockerfile
# Fichier       : AlpineLuaGOF.dockerfile

# Image de base : Alpine Linux dernière version 
FROM alpine:latest

# informations sur l'auteur de l'image
MAINTAINER uixiu <human@earth.planet>

# mise a jour du gestionnaire de paquets Alpine 
RUN apk update && apk upgrade

# installer/embarquer les paquets Lua: lua5.3 et lua5.3-dev
RUN apk add lua5.3 lua5.3-dev

# installer git
RUN apk add git

# embarquer le jeu de la vie (source hébergée sur GitHub)
RUN git clone https://github.com/uixiu/game-of-life-lua.git

# désinstaller git
RUN apk del git

# ajouter les chemin de recherche Lua par défaut 
ENV PATH="/usr/bin/lua5.3:/usr/lib/lua5.3:/usr/include/lua5.3:${PATH}"

# initisaliser le repretoire de travail contenant les sources gol.lua, gol_play.lua
WORKDIR /game-of-life-lua

# lancer jeu au lancement du conteneur
ENTRYPOINT ["lua5.3","gol_play.lua"]
