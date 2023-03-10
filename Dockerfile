FROM maven:3.8.6 as build
ENV HOME=/usr/app
RUN mkdir -p $HOME
WORKDIR $HOME
ADD . $HOME
RUN mvn clean test pmd:check validate
RUN mvn clean package


FROM openjdk:19-alpine
EXPOSE 8080
COPY --from=build /usr/app/target/java-springboot-ci-cd-with-github-actions.jar java-springboot-ci-cd-with-github-actions.jar
ENTRYPOINT ["java","-jar","/java-springboot-ci-cd-with-github-actions.jar"]