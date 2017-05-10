FROM centos:latest
MAINTAINER Patrick Springer
LABEL description="Elk Docker"

COPY ./repos/elastic.repo /etc/yum.repos.d

RUN yum -y update \
    && yum -y install wget vim java-1.8.0-openjdk java-1.8.0-openjdk-devel \
    && wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.0.2.tar.gz \
    && tar -xzf elasticsearch-5.0.2.tar.gz \
    && cd elasticsearch-5.0.2/ 

EXPOSE 5000 5601 9200
CMD ["/elasticsearch-5.0.2/bin/elasticsearch"]
