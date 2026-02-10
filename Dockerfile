# Image Tomcat prête à l’emploi
FROM tomcat:9.0

# Déploiement de l’application générée par Maven
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

