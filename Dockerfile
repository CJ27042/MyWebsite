# Use official OpenJDK 17 runtime image (lightweight alpine version)
FROM openjdk:17-jdk-alpine

# Create a volume pointing to /tmp (optional for Spring Boot)
VOLUME /tmp

# Build argument for jar file path
ARG JAR_FILE=target/*.jar

# Copy the jar built by Maven into the container
COPY ${JAR_FILE} app.jar

# Expose default Spring Boot port
EXPOSE 8080

# Run the Spring Boot app, use the PORT env var provided by Render or default to 8080
ENTRYPOINT ["sh", "-c", "java -Dserver.port=${PORT:-8080} -jar /app.jar"]
