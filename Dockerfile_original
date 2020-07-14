FROM adoptopenjdk/openjdk11:alpine-jre
RUN apt-get -y update && apt-get -y install maven
RUN git clone https://github.com/deepakjena-design/springboot-k8-mysql.git
WORKDIR springboot-k8-mysql
RUN mvn clean install
ADD target/springboot-k8s-mysql-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
