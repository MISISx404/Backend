FROM openjdk:18-slim

# Install Maven
RUN apt-get update && apt-get install -y maven && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY pom.xml . 
RUN mvn dependency:go-offline

COPY . .
RUN mvn package -DskipTests

ENTRYPOINT ["java","-jar","target/ProdOlymp-0.0.1-SNAPSHOT.jar"]
