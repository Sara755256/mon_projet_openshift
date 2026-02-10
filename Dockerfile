##################### Stage Build
FROM maven AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

# Compiler le projet et générer le WAR
RUN mvn package -DskipTests

##################### Stage Run
FROM tomcat

# Supprimer le WAR par défaut
RUN rm -rf /usr/local/tomcat/webapps/*

# Copier le WAR généré
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
