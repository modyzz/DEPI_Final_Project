FROM openjdk:21

WORKDIR /usr/src/myapp

COPY . .

RUN chmod +x ./mvnw
RUN ./mvnw clean package

EXPOSE 8080

CMD ["./mvnw", "cargo:run", "-P", "tomcat90"]
