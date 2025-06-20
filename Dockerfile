# Stage 1: Build the JAR
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /build
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Create runtime container
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app
COPY --from=builder /build/target/gatling-maven-plugin-demo-java-3.9.0.jar /app/

CMD ["java", "-jar", "gatling-maven-plugin-demo-java-3.9.0.jar"]
