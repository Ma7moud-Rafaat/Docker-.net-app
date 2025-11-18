FROM mcr.microsoft.com/dotnet/sdk:10.0 As build

WORKDIR /source

COPY *.csproj ./
RUN dotnet restore

COPY . ./
RUN dotnet publish -c release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:10.0 As final

WORKDIR /app
COPY --from=build /app .

ENTRYPOINT [ "dotnet","hrapp.dll" ]


