# Usa la imagen base de ASP.NET Runtime para la etapa final
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

# Usa la imagen SDK de .NET para la construcción
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src

# Copia el archivo de proyecto y restaura las dependencias
COPY Hello_World_CSharp.csproj .
RUN dotnet restore Hello_World_CSharp.csproj

# Copia todo el contenido del proyecto y realiza la compilación
COPY . .
RUN dotnet build Hello_World_CSharp.csproj -c $BUILD_CONFIGURATION -o /app/build

# Publica la aplicación en la carpeta /app/publish
FROM build AS publish
RUN dotnet publish Hello_World_CSharp.csproj -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# Usa la imagen base para la etapa final y copia los archivos publicados
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

# Define el punto de entrada de la aplicación
ENTRYPOINT ["dotnet", "Hello_World_CSharp.dll"]