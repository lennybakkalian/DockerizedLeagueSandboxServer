@echo off
set dockername=leaguesandbox_gameserver

if exist GameServer goto skipclone
git clone https://github.com/LeagueSandbox/GameServer
:skipclone
cd GameServer
git pull
git submodule init
git submodule update
cd ..

REM remove old images
echo Remove old images and containers
docker stop %dockername%
docker container rm %dockername%
docker image rm %dockername% -f

echo Build docker image as %dockername%

REM build docker image
docker build -t %dockername% .

echo Run docker image %dockername%

REM debug: --entrypoint /bin/bash 
docker run -p 5119:5119/udp --name %dockername% -it %dockername%

timeout 3 >NUL
REM exit