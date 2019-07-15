FROM alpine:latest as downloader

ARG SPARK_VERSION=2.4.3

RUN apk --update --no-cache add \
		curl tar

RUN curl -o /tmp/spark.tgz http://apache.mirror.anlx.net/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.7.tgz
RUN	mkdir -p /spark \
	&& tar --strip-components=1 -C /spark -xzf /tmp/spark.tgz


FROM openjdk:8-alpine
RUN apk --update --no-cache add bash

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_HOME /opt/spark
ENV SPARK_LOGS_DIR ${SPARK_HOME}/logs
ENV PATH $PATH:${SPARK_HOME}/bin

COPY scripts/* /usr/local/bin/
COPY --from=downloader /spark ${SPARK_HOME}

EXPOSE 8080 7077 6066

ENTRYPOINT ["start-shell.sh"]
