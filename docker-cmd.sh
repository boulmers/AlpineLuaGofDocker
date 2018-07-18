#!/bin/bash
# exécuter de préférence les instruction une après l'autre

# consruire l'image se basant sur le script 'AlpineLuaGOF.dockerfile' et vider le cache et les fichiers intermediaires
sudo docker build --tag alpine_lua_gof_img --file AlpineLuaGOF.dockerfile --no-cache --rm .

# lancer le conteneur de l'image précédante et le supprimer juste apret son arrêt par [Ctrl + C]
sudo docker run alpine_lua_gof_img --rm 
