FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["ManagedIdentityDemo.API/ManagedIdentityDemo.API.csproj", "ManagedIdentityDemo.API/"]
RUN dotnet restore "ManagedIdentityDemo.API/ManagedIdentityDemo.API.csproj"
COPY . .
WORKDIR "/src/ManagedIdentityDemo.API"
RUN dotnet build "ManagedIdentityDemo.API.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "ManagedIdentityDemo.API.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

ENV AZURE_TENANT_ID=<tenant-id>
ENV AZURE_CLIENT_ID=<client-id>
ENV AZURE_CLIENT_SECRET=<client-sercret>

ENTRYPOINT ["dotnet", "ManagedIdentityDemo.API.dll"]
