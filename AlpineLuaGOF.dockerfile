# Nom fichier   : AlpineLuaGOF.dockerfile
# Image de base : Linux Alpine derniere version 
FROM alpine:latest

#informations sur l'auteur de l'image
MAINTAINER  <human@earth.planet>

# mise a jour du gestionnaire de paquets Alpine : RUN commande 
RUN apk update && apk upgrade

# installer/embarquer les paquets Lua: lua5.3 et lua5.3-dev (optionnel pour illustration)
RUN apk add lua5.3 lua5.3-dev

# installer git
RUN apk add git

# embarquer le jeu de la vie 
RUN git clone https://github.com/uixiu/game-of-life-lua.git

# desinstaller git
RUN apk del git

# ajouter les chemin de recherche Lua par defaut  (optionnel pour illustration) 
ENV PATH="/usr/bin/lua5.3:/usr/lib/lua5.3:/usr/include/lua5.3:${PATH}"

# initisaliser le repretoire de travail contenant les sources gol.lua, gol_play.lua
WORKDIR /game-of-life-lua

# lancer jeu au lancement du conteneur: ENTRYPOINT ["commande","argument1","argument2"...]
ENTRYPOINT ["lua5.3","gol_play.lua"]

