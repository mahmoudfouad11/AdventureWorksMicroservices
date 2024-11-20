# Use the .NET 8.0 SDK for building and runtime
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy the project file and restore dependencies
COPY AdventureWorksMicroservices.csproj ./
RUN dotnet restore "AdventureWorksMicroservices.csproj"

# Copy the entire project and build it
COPY . ./
RUN dotnet publish -c Release -o /app

# Use the ASP.NET runtime image for running the application
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "AdventureWorksMicroservices.dll"]
