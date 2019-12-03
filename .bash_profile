# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
export HADOOP_HOME=/home/hadoop/hadoop
export HADOOP_INSTALL=$HADOOP_HOME
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HADOOP_CONF_DIR=/home/hadoop/hadoop/etc/hadoop
export ZOOKEEPER_HOME=/home/hadoop/zookeeper
export HBASE_HOME=/home/hadoop/hbase
export SQOOP_HOME=/home/hadoop/sqoop
export HIVE_HOME=/home/hadoop/hive
export STORM_HOME=/home/hadoop/storm
export PATH=$PATH:$ZOOKEEPER_HOME/bin:$HADOOP_HOME/sbin:$HADOOP_HOME/bin:$HBASE_HOME/bin:$HIVE_HOME/bin:$SQOOP_HOME/bin:$STORM_HOME/bin

