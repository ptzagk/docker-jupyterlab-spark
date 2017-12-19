FROM dclong/jupyterlab

ARG spark=spark-2.2.1-bin-hadoop2.7

RUN apt-get update \
    && apt-get install -y \
        scala maven \
    && wget http://d3kbcqa49mib13.cloudfront.net/$spark.tgz -O /$spark.tgz \
    && tar -zxvf /$spark.tgz -C /opt/ \
    && rm /$spark.tgz

COPY scripts /scripts
RUN pip3 install /scripts/toree.tar.gz \
    && jupyter toree install --spark_home=/opt/$spark/ \
    && rm /scripts/toree.tar.gz 

