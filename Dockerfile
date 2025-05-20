# Используем официальный образ с OpenJDK 17
FROM openjdk:17-jdk-slim

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем файл JAR из локальной директории (сборка должна быть уже готова)
COPY target/*.jar petclinic.jar

# Открываем порт 8080 (порт приложения)
EXPOSE 8080

# Команда для запуска приложения
ENTRYPOINT ["java", "-jar", "petclinic.jar"]
