# Etapa de construcción
FROM golang:1.19-alpine AS build

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el código fuente al contenedor
COPY main.go .

# Compilar el binario de la aplicación
RUN go build -o main .

# Imagen final
FROM alpine:latest

# Copiar el binario desde la etapa de construcción
COPY --from=build /app/main /main

# Exponer el puerto en el que correrá el servidor
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["/main"]
