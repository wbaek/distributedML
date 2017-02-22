FROM wbaek/mesos:1.1.0-agent
MAINTAINER Woonhyuk Baek <wbaek.personal@gmail.com>

RUN mkdir -p /workspace/spark && \
    cd /workspace/spark && \
    wget http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.6.tgz && \
    tar -zxf spark-2.1.0-bin-hadoop2.6.tgz && \
    ln -s spark-2.1.0-bin-hadoop2.6 spark && \
    rm -rf spark-*.tgz

WORKDIR /workspace/spark/spark
ENTRYPOINT ["./bin/spark-class", "org.apache.spark.deploy.mesos.MesosClusterDispatcher", "--name", "spark"]
