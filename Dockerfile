FROM openjdk:8
MAINTAINER Andrés García <andresgarcia.kaox@gmail.com>

ENV ARTIFACTORY_VERSION 5.0.1
ENV ARTIFACTORY_URL https://bintray.com/artifact/download/jfrog/artifactory/jfrog-artifactory-oss-${ARTIFACTORY_VERSION}.zip

RUN cd "/tmp" && \
	curl -L ${ARTIFACTORY_URL} -o "artifactory.zip" && \
	unzip -d /var/opt/jfrog/ /tmp/artifactory.zip && \
    rm -f /tmp/artifactory.zip

WORKDIR /var/opt/jfrog/artifactory-oss-${ARTIFACTORY_VERSION}
CMD bin/artifactory.sh

VOLUME /var/opt/jfrog/artifactory-oss-${ARTIFACTORY_VERSION}/data

EXPOSE 8081