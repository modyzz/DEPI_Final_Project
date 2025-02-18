FROM openjdk:21

COPY . /usr/src/myapp

WORKDIR /usr/src/myapp

RUN chmod +x ./mvnw
RUN ./mvnw clean package

CMD ./mvnw cargo:run -P tomcat90
