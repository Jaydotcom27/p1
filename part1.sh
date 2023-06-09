#! /bin/sh
#! /usr/bin/python
../start.sh

/usr/local/hadoop/bin/hdfs dfs -rm -r /part1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /part1/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /part1/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../mapreduce-test-data/hdfstest1/nyc_parking_violations_data.csv  /part1/input/

/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar  \
-file hour_mapper.py -mapper hour_mapper.py \
-file reducer.py -reducer reducer.py \
-input /part1/input/* -output /part1/output/Q1/hour

echo "--------------------------- Question 1: At what hour of the day are tickets most likely to be issued? ---------------------------" 
/usr/local/hadoop/bin/hdfs dfs -cat /part1/output/Q1/hour/part-00000

/usr/local/hadoop/bin/hdfs dfs -rm -r /part1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /part1/output/

../stop.sh
