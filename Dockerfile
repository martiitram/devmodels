FROM maven:3.8.6 as build
ENV HOME=/usr/app
RUN mkdir -p $HOME
WORKDIR $HOME
ADD . $HOME
RUN mvn clean test pmd:check validate
RUN mvn clean package

#
##
## Package stage
##
#FROM openjdk:19-alpine
#COPY --from=build /usr/app/target/devmodels-0.0.1-SNAPSHOT.jar /usr/local/lib/app.jar
#EXPOSE 8080
#ENTRYPOINT ["java","-jar","/usr/app/target/devmodels-0.0.1-SNAPSHOT.jar"]


FROM openjdk:19-alpine
EXPOSE 8080
ADD target/java-springboot-ci-cd-with-github-actions.jar /java-springboot-ci-cd-with-github-actions.jar
#COPY --from=build /usr/app/target/java-springboot-ci-cd-with-github-actions.jar java-springboot-ci-cd-with-github-actions.jar
ENTRYPOINT ["java","-jar","/java-springboot-ci-cd-with-github-actions.jar"]