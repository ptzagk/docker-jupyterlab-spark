FROM dclong/jupyterlab:centos

ARG scala=scala-2.11.11
ARG scala.rpm=${scala}.rpm
ARG spark=spark-2.1.0-bin-hadoop2.7
ARG spark.tgz=${spark}.tgz 

RUN yum update -y \
    && yum install -y \
        wget \
        scala \
    && wget https://downloads.lightbend.com/scala/2.11.11/$scala.rpm -O /$scala.rpm \
    && wget http://d3kbcqa49mib13.cloudfront.net/$spark.tgz -O /$spark.tgz \
    && yum install /$scala.rpm \
    && tar -zxvf /$spark.tgz -C /opt/ \
    && rm /$spark.tgz

COPY toree-0.2.0.dev1.tar.gz /
RUN pip3 install /toree-0.2.0.dev1.tar.gz \
    && jupyter toree install --spark_home=/opt/$spark/ \
    && rm /toree-0.2.0.dev1.tar.gz 

