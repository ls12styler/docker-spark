#!/bin/bash

export SPARK_MASTER_HOST=`hostname`

mkdir -p $SPARK_LOGS_DIR

ln -sf /dev/stdout $SPARK_LOGS_DIR/spark-master.out

spark-class org.apache.spark.deploy.master.Master $@ >> $SPARK_LOGS_DIR/spark-master.out
