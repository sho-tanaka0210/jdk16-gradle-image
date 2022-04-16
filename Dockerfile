FROM openjdk:17-jdk-buster

WORKDIR /workdir

# If you want to upgrade gradle, change the following and rebuild
# gradleのバージョンアップをしたい場合、以下を変更して再ビルド
ARG GRADLE_VERSION='gradle-7.4.2'

RUN apt-get update && \
  apt-get install -y wget && \
  mkdir -p /opt/gradle && \
  wget https://services.gradle.org/distributions/${GRADLE_VERSION}-bin.zip -P /opt/gradle/ && \
  unzip -d /opt/gradle /opt/gradle/${GRADLE_VERSION}-bin.zip

ENV PATH $PATH:/opt/gradle/${GRADLE_VERSION}/bin/
