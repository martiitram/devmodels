##
## Build stage
##
#FROM maven:3.9 AS build
##COPY src /home/app/src
##COPY pom.xml /home/app
#COPY . /home/app
#RUN mvn -f /home/app/pom.xml clean package



FROM maven:3.8.6 as build
ENV HOME=/usr/app
RUN mkdir -p $HOME
WORKDIR $HOME
ADD . $HOME
RUN mvn clean package
#
#FROM openjdk:8-jdk-alpine
#COPY --from=build /usr/app/target/single-module-caching-1.0-SNAPSHOT-jar-with-dependencies.jar /app/runner.jar
#ENTRYPOINT java -jar /app/runner.jar
#



#
# Package stage
#
FROM openjdk:19-alpine
COPY --from=build /usr/app/target/devmodels-0.0.1-SNAPSHOT.jar /usr/local/lib/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/app.jar"]