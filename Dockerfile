FROM java:alpine

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG /spark/logs

RUN apk --update --no-cache add \
		wget tar bash

RUN wget http://apache.mirror.anlx.net/spark/spark-2.3.2/spark-2.3.2-bin-hadoop2.7.tgz
RUN	tar -xzf spark-2.3.2-bin-hadoop2.7.tgz && \
	mv spark-2.3.2-bin-hadoop2.7 /spark

COPY bashrc /root/.bashrc

COPY scripts/* /

EXPOSE 8080 7077 6066

CMD /start-shell.sh
