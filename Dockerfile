# FROM maven:3.8.6-jdk-11-slim AS build
# COPY src /home/app/src
# COPY pom.xml /home/app
# RUN mvn -f /home/app/pom.xml  package

# FROM openjdk:11-jre-slim
FROM tomcat:9.0
# COPY --from=build /home/app/target/login-struts.war /usr/local/tomcat/webapps/
COPY ./target/login-struts.war /usr/local/tomcat/webapps/
EXPOSE 8080
ENTRYPOINT ["catalina.sh", "run"]