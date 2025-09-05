# Stage 1: Build the JAR using Maven
FROM maven:3.9.3-eclipse-temurin-17 AS build
WORKDIR /app

# Copy pom.xml and download dependencies to cache them
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code and build the JAR
COPY src ./src
RUN mvn clean package -Ptest

# Stage 2: Create the runtime image
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copy the JAR from the build stage
COPY --from=build /app/target/spring-dockerhub-docker-0.0.1-SNAPSHOT.jar /app/app.jar

# Expose the port the application runs on
EXPOSE 8085

# Command to run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]