# Use lightweight Java 17 runtime
FROM eclipse-temurin:17-jre

# Set app directory
WORKDIR /app

# Copy the JAR from target folder
COPY target/test-0.0.1-SNAPSHOT.jar app.jar

# Expose application port
EXPOSE 8100

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
