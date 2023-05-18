FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /app

#COPY *.sln .
#COPY D:/Newfolder/margbookscoreapi/ .

COPY . .
RUN dotnet ef migrations InitialCreate
RUN dotnet restore "login register api.sln"

RUN dotnet publish "login register api.sln" -c Release -o out

FROM mcr.microsoft.com/dotnet/sdk:5.0
WORKDIR /app
COPY --from=build /app/out .
EXPOSE 5000
# Optional: Set this here if not setting it from docker-compose.yml
# ENV ASPNETCORE_ENVIRONMENT Development
ENTRYPOINT ["dotnet", "login register api.dll"]
#ENTRYPOINT ["dotnet", "Web.dll"]