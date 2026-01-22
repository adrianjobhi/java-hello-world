# Build stage
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src

# Compila y muestra qué se generó
RUN mvn -DskipTests package && \
    echo "=== TARGET CONTENTS ===" && \
    ls -la target

# Run stage
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copiamos el jar real (el que vimos en tu target local)
COPY --from=build /app/target/java-hello-world-1.0.0.jar /app/app.jar

EXPOSE 8080
CMD ["java", "-jar", "/app/app.jar"]
