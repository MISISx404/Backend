# Stage 1: Build
FROM maven:3.9.4-eclipse-temurin-18 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY . .
RUN mvn package -DskipTests

# Stage 2: Run
FROM openjdk:18-slim
WORKDIR /app
COPY --from=build /app/target/ProdOlymp-0.0.1-SNAPSHOT.jar /app/app.jar
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
