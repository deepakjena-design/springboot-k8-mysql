FROM ubuntu:latest
WORKDIR /tmp/docker
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install git
RUN apt-get -y install openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
RUN apt-get -y update && apt-get -y install maven
RUN git clone https://github.com/deepakjena-design/springboot-k8-mysql.git
WORKDIR springboot-k8-mysql
RUN mvn clean install
ADD target/springboot-k8s-mysql-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]