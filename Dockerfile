# Estágio de build
FROM maven:3.9.5-eclipse-temurin-17 AS build

WORKDIR /app

# Copia apenas o pom.xml e baixa dependências (aproveitando o cache)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copia o código fonte e faz o build
COPY src /app/src
RUN mvn clean package -DskipTests

# Estágio final, utilizando apenas JRE
FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

# Copia o JAR gerado no build
COPY --from=build /app/target/*.jar /app/app.jar

# Expor a porta 8080
EXPOSE 8080

# Comando de inicialização
CMD ["java", "-jar", "/app/app.jar"]
