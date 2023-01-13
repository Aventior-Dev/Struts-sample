FROM maven:3.8.6-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
# RUN mvn -f /home/app/pom.xml clean package
RUN mvn -f /home/app/pom.xml  package

FROM openjdk:11-jre-slim
COPY --from=build /home/app/target/login-struts.war /usr/local/lib/login-struts.war
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/login-struts.war"]