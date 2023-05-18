FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

#COPY *.sln .
#COPY D:/Newfolder/margbookscoreapi/ .
ENV PATH $PATH:/root/.dotnet/tools
RUN dotnet tool install -g dotnet-ef --version 6
COPY . .
#RUN dotnet build
RUN cd InspectionAPI && dotnet-ef migrations add Intialcreate
RUN cd InspectionAPI && dotnet-ef database update
RUN dotnet restore "InspectionAPIApp.sln"

#RUN dotnet publish "InspectionAPIApp.sln" -c Release -o out
RUN dotnet publish "InspectionAPIApp.sln"  -o /app/published-app

FROM mcr.microsoft.com/dotnet/sdk:6.0
WORKDIR /app
#COPY --from=build /app/InspectionAPI.exe /app/
#COPY --from=build /app/out .
COPY --from=build /app/published-app /app

EXPOSE 7240

ENTRYPOINT ["dotnet", "InspectionAPI.dll"]
