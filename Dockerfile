FROM gradle:8-jdk17-alpine AS gradle_builder
#RUN mv build/libs/*.jar build/libs/app.jar
WORKDIR /app
COPY . .
RUN gradle clean build

FROM openjdk:17-alpine
# 設置當前路徑 ./ 同等 /app
WORKDIR /app
RUN ls -la /app
# /app/build/app.jar 同等 ./app.jar
COPY --from=gradle_builder /app/build/libs/*.jar ./app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]