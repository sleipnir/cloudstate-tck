FROM openjdk:jdk-buster

ENV SBT_VERSION=1.3.8

RUN apt update && \
    apt install git && \
    git --version

RUN \
  curl -L -o sbt-$SBT_VERSION.deb http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  sbt sbtVersion

WORKDIR /build
COPY build.sh /
COPY install-dependencies.sh /
RUN chmod +x /install-dependencies.sh && /install-dependencies.sh
RUN chmod +x /build.sh

VOLUME /build
VOLUME /buid/cloudstate/tck/src/it/resources

ENTRYPOINT ["/build.sh"]