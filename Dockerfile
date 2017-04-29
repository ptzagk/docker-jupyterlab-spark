FROM dclong/jupyterlab

ARG spark=spark-2.1.0-bin-hadoop2.7
ARG spark.tgz=${spark}.tgz 

RUN apt-get update \
    && apt-get install -y wget \
    && wget http://d3kbcqa49mib13.cloudfront.net/$spark.tgz -O /$spark.tgz \
    && tar -zxvf /$spark.tgz -C /opt/ \
    && rm /$spark.tgz

RUN pip3 install toree-0.2.0.dev1.tar.gz \
    && jupyter toree install --spark_home=/opt/$spark/

ADD script.sh /

