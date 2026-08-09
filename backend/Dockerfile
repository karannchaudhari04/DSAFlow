# Build stage
FROM gradle:8.7.0-jdk21 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle bootJar --no-daemon

# Run stage
FROM eclipse-temurin:21-jre-alpine
EXPOSE 8080
RUN mkdir /app
COPY --from=build /home/gradle/src/build/libs/*.jar /app/dsa-journey.jar
ENTRYPOINT ["java", "-jar", "/app/dsa-journey.jar"]
