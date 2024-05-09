FROM openjdk:17
EXPOSE 8080
ADD target/springboot-app-ci-cd.jar springboot-app-ci-cd.jar
ENTRYPOINT ["java","-jar","/springboot-app-ci-cd.jar"]