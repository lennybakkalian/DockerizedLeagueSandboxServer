FROM mcr.microsoft.com/dotnet/sdk:3.1

EXPOSE 5119/udp

WORKDIR /app

COPY GameServer/ /app/

RUN dotnet build .

COPY GameInfo.json /app/GameServerConsole/bin/Debug/netcoreapp3.0/Settings/


ENTRYPOINT cd /app/GameServerConsole/bin/Debug/netcoreapp3.0 && ./GameServerConsole