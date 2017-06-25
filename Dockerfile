FROM dclong/jupyterlab:centos

ARG version_scala=2.11.11
ARG scala=scala-$version_scala
ARG spark=spark-2.1.0-bin-hadoop2.7

RUN yum update -y \
    && yum install -y \
        wget \
    && wget https://downloads.lightbend.com/scala/$version_scala/$scala.rpm -O /$scala.rpm \
    && wget http://d3kbcqa49mib13.cloudfront.net/$spark.tgz -O /$spark.tgz \
    && yum install -y /$scala.rpm \
    && tar -zxvf /$spark.tgz -C /opt/ \
    && rm /$scala.rpm \
    && rm /$spark.tgz

COPY toree-0.2.0.dev1.tar.gz /
RUN pip3 install /toree-0.2.0.dev1.tar.gz \
    && jupyter toree install --spark_home=/opt/$spark/ \
    && rm /toree-0.2.0.dev1.tar.gz 

