#!/usr/bin/env bash

#echo $ZOOKEEPER_HOME
ZOOKEEPER_HOME=$ZOOKEEPER_HOME
if [ $ZOOKEEPER_HOME != ""  ]; then
    confFile=$ZOOKEEPER_HOME/conf/zoo.cfg
    servers=$(cat "$confFile" | sed '/^server/!d;s/^.*=//;s/:.*$//g;/^$/d')
    case $1 in
    start)
	for server in $servers ; do
	    echo $server: start zkServer
	    ssh $server "$ZOOKEEPER_HOME/bin/zkServer.sh start"
	done
    ;;
    stop)
	for server in $servers ; do
	    echo $server: stop zkServer
	    ssh $server "$ZOOKEEPER_HOME/bin/zkServer.sh stop"
	done
    ;;
    status)
	for server in $servers ; do
 	    echo $server: zkServer status
	    ssh $server "$ZOOKEEPER_HOME/bin/zkServer.sh status"
	done
    ;;
    *)
	echo "Usage:  {start|stop|status}"
    ;;
    esac
fi
