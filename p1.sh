#! /bin/sh
#! /usr/bin/python
../start.sh

/usr/local/hadoop/bin/hdfs dfs -rm -r /p1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /p1/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /p1/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../mapreduce-test-data/hdfstest1/nyc_parking_violations_data.csv  /p1/input/

/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar  \
-file freq_hour_mapper.py -mapper freq_hour_mapper.py \
-file reducer.py -reducer reducer.py \
-input /p1/input/* -output /p1/output/Q1/hour

echo "--------------------------- Question 1: At what hour of the day are tickets most likely to be issued? ---------------------------" 
/usr/local/hadoop/bin/hdfs dfs -cat /p1/output/Q1/part-00000

/usr/local/hadoop/bin/hdfs dfs -rm -r /p1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /p1/output/

../stop.sh
