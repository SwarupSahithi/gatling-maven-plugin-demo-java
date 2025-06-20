# Use lightweight JDK base image
FROM eclipse-temurin:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the Gatling fat JAR into the container
COPY target/gatling-maven-plugin-demo-java-3.9.0.jar /app/


# Optional: expose any port if needed for monitoring (not typically needed for headless Gatling)
EXPOSE 8080

# Default command to run the Gatling simulation
CMD ["java", "-jar", "gatling-maven-plugin-demo-java-3.9.0.jar"]
