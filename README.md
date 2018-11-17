# Docker Apache Spark Cluster

A scalable Apache Spark cluster running in Docker.

Usage:
```
docker-compose up --scale spark-slave=3
```

By default, running the image without a command will take you into the Spark shell:
```
docker run --rm -it -e SPARK_MASTER=spark://spark-master:7077 --network docker-spark_spark-network ls12styler/spark:latest
```
You can overide the command like so if you need anything else:
```
docker run --rm -it -e SPARK_MASTER=spark://spark-master:7077 --network docker-spark_spark-network ls12styler/spark:latest /bin/bash
```

## Workflow

```
docker-compose up --scale spark-slave=3
docker build -t ls12styler/spark:latest .
docker run --rm -it -e SPARK_MASTER=spark://spark-master:7077 --network docker-spark_spark-network ls12styler/spark:latest

```

Used as a reference: https://medium.com/@marcovillarreal_40011/creating-a-spark-standalone-cluster-with-docker-and-docker-compose-ba9d743a157f
