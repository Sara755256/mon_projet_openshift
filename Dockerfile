FROM quay.io/centos7/maven-36-centos7:latest AS builder
WORKDIR /app
COPY . .
RUN mvn clean install package

FROM quay.io/lib/tomcat
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
