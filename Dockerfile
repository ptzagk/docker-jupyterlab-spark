FROM dclong/jupyterlab

ENV HOME=/root
ARG spark=spark-2.1.2-bin-hadoop2.7

RUN apt-get update \
    && apt-get install -y \
        scala maven \
    && wget http://mirrors.advancedhosters.com/apache/spark/spark-2.1.2/spark-2.1.2-bin-hadoop2.7.tgz \
    && tar -zxvf /$spark.tgz -C /opt/ \
    && rm /$spark.tgz

COPY scripts /scripts
RUN pip3 install /scripts/toree.tar.gz \
    && pip3 install --upgrade setuptools \
    && jupyter toree install --spark_home=/opt/$spark/ \
    && rm /scripts/toree.tar.gz 

