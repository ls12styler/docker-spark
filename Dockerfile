FROM openjdk:12-alpine

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG /spark/logs
ENV SPARK_WORKER_LOG /spark/logs
ENV SPARK_VERSION 2.4.0

RUN apk --update --no-cache add \
		wget tar bash

RUN wget http://apache.mirror.anlx.net/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.7.tgz
RUN	tar -xzf spark-${SPARK_VERSION}-bin-hadoop2.7.tgz && \
	mv spark-${SPARK_VERSION}-bin-hadoop2.7 /spark && \
	rm spark-${SPARK_VERSION}-bin-hadoop2.7.tgz

COPY bashrc /root/.bashrc

COPY scripts/* /

EXPOSE 8080 7077 6066

CMD /start-shell.sh
