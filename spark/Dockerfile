FROM python:3.11-bullseye AS builder
LABEL python_version=python3.11

USER root

# # Add Dependencies for PySpark
RUN QNUMBER='' \
    && export QNUMBER \
    PASSWORD='' \
    && export PASSWORD \
    http_proxy=http://${QNUMBER}:${PASSWORD}@207.248.117.132:8080 \
    && export http_proxy \
    https_proxy=http://${QNUMBER}:${PASSWORD}@207.248.117.132:8080 \
    && export https_proxy \
    && apt-get update \
    && apt-get install -y curl vim wget software-properties-common ssh net-tools ca-certificates rsync

# Spark dependencies
# Default values can be overridden at build time
# (ARGS are in lowercase to distinguish them from ENV)
ARG openjdk_version="17"

RUN QNUMBER='' \
    && export QNUMBER \
    PASSWORD='' \
    && export PASSWORD \
    http_proxy=http://${QNUMBER}:${PASSWORD}@207.248.117.132:8080 \
    && export http_proxy \
    https_proxy=http://${QNUMBER}:${PASSWORD}@207.248.117.132:8080 \
    && export https_proxy \
    && apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    openjdk-${openjdk_version}-jre-headless \
    ca-certificates-java && \
    apt-get clean && rm -rf /var/lib/apt/lists/*


RUN echo ls

# Fix the value of PYTHONHASHSEED
# Note: this is needed when you use Python 3.3 or greater
ENV SPARK_VERSION=spark-3.5.0 \
HADOOP_VERSION=hadoop-3.4.0 \
SPARK_HOME=/opt/spark \
PYTHONHASHSEED=1

RUN QNUMBER='' \
    && export QNUMBER \
    PASSWORD='' \
    && export PASSWORD \
    http_proxy=http://${QNUMBER}:${PASSWORD}@207.248.117.132:8080 \
    && export http_proxy \
    https_proxy=http://${QNUMBER}:${PASSWORD}@207.248.117.132:8080 \
    && export https_proxy \
    && wget --no-verbose -O apache-spark.tgz "https://archive.apache.org/dist/spark/${SPARK_VERSION}/${SPARK_VERSION}-bin-without-hadoop.tgz" \
    && mkdir -p /opt/spark \
    && tar -xf apache-spark.tgz -C /opt/spark --strip-components=1 \
    && rm apache-spark.tgz


RUN QNUMBER='' \
    && export QNUMBER \
    PASSWORD='' \
    && export PASSWORD \
    http_proxy=http://${QNUMBER}:${PASSWORD}@207.248.117.132:8080 \
    && export http_proxy \
    https_proxy=http://${QNUMBER}:${PASSWORD}@207.248.117.132:8080 \
    && export https_proxy \
    && wget --no-verbose -O hadoop.tgz "https://dlcdn.apache.org/hadoop/common/${HADOOP_VERSION}/${HADOOP_VERSION}.tar.gz" \
    && mkdir -p /opt/spark \
    && tar -xf hadoop.tgz -C /opt/spark --strip-components=1 \
    && rm hadoop.tgz

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
# ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-arm64

FROM builder AS apache-spark

WORKDIR /opt/spark

ENV SPARK_MASTER_PORT=7077 \
SPARK_MASTER_WEBUI_PORT=8080 \
SPARK_LOG_DIR=/opt/spark/logs \
SPARK_MASTER_LOG=/opt/spark/logs/spark-master.out \
SPARK_WORKER_LOG=/opt/spark/logs/spark-worker.out \
SPARK_WORKER_WEBUI_PORT=8080 \
SPARK_WORKER_PORT=7000 \
SPARK_MASTER="spark://spark-master:7077" \
SPARK_WORKLOAD="master"

EXPOSE 8080 7077 7000

RUN mkdir -p $SPARK_LOG_DIR && \
touch $SPARK_MASTER_LOG && \
touch $SPARK_WORKER_LOG && \
ln -sf /dev/stdout $SPARK_MASTER_LOG && \
ln -sf /dev/stdout $SPARK_WORKER_LOG

COPY dependencies/ /opt/spark/jars/


COPY start-spark.sh /

CMD ["/bin/bash", "/start-spark.sh"]