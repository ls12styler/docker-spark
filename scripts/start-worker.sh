#!/bin/bash

mkdir -p $SPARK_LOGS_DIR

ln -sf /dev/stdout $SPARK_LOGS_DIR/spark-worker.out

spark-class org.apache.spark.deploy.worker.Worker $@ >> $SPARK_LOGS_DIR/spark-worker.out
