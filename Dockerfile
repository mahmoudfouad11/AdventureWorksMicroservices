FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY *.sln ./
COPY AdventureWorks.Api/*.csproj ./AdventureWorks.Api/
RUN dotnet restore
COPY . ./
WORKDIR /src/AdventureWorks.Api
RUN dotnet publish -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "AdventureWorks.Api.dll"]