#FROM eclipse-temurin:17

# jre 버전 (실행확인 완료)
FROM eclipse-temurin:17-jre

ARG JAR_FILE=build/libs/*.jar

WORKDIR /app

COPY ${JAR_FILE} app.jar

#ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=local", "app.jar"]
ENTRYPOINT ["java","-jar","-Dspring.profiles.active=default","-Dspring-boot.run.jvmArguments=-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005","app.jar"]
