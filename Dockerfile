# Use an official Maven image to build the project
FROM maven:3.8.1-openjdk-17-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and source code into the container
COPY pom.xml .
COPY src ./src

# Run Maven clean and install
RUN mvn clean install
# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim
#FROM openjdk:11-jre-slim
# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY target/demo-0.0.1-SNAPSHOT.jar app.jar

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]