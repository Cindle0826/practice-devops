FROM gradle:8-jdk17-alpine AS gradle_builder
WORKDIR /app
# 本機 容器
COPY . /app
RUN gradle clean build

FROM openjdk:17-alpine
# 設置容器當前運行路徑為 /app
WORKDIR /app
# 從 gradle_builder 的 /app/build/libs/*.jar 中複製到 /app/app.jar
COPY --from=gradle_builder /app/build/libs/*.jar /app/app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]