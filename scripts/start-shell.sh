#!/bin/bash

source /root/.bashrc

ARGS="$@"
MSG="Running Spark in standalone mode."

if [ ! -z "$SPARK_MASTER" ]; then
	ARGS="${ARGS} --master ${SPARK_MASTER}"
	MSG="Running Spark in cluster mode, with master: ${SPARK_MASTER}."
fi

echo ${MSG}
/spark/bin/spark-shell ${ARGS}
