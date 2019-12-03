#!/bin/bash

SUPERVISOR_HOST_CONF=$STORM_HOME/conf/$SUPERVISOR_HOST_CONF
case $1 in
start)
	echo $HOSTNAME: starting nimbus, logging to $STORM_HOME/logs/nimbus.out
	nohup $STORM_HOME/bin/storm nimbus >> $STORM_HOME/logs/nimbus.out 2>&1 &
	echo $HOSTNAME: starting ui, logging to $STORM_HOME/logs/nimbus.out
	nohup $STORM_HOME/bin/storm ui >> $STORM_HOME/logs/ui.out 2>&1 &
        for supervisor in `cat $SUPERVISOR_HOST_CONF`
        do
	    echo $supervisor: starting supervisor, logging to $STORM_HOME/logs/supervisor.out
            ssh $supervisor nohup $STORM_HOME/bin/storm supervisor >> $STORM_HOME/logs/supervisor.out 2>&1 &
	done
    ;;
stop)
	echo $HOSTNAME: stop nimbus
	kill -9 `jps | grep nimbus|awk '{print $1}' `
	echo $HOSTNAME: stop core
	kill -9 `jps | grep core|awk '{print $1}' `
	#echo $HOSTNAME: stop ui
	#kill -9 `jps | grep ui|awk '{print $1}' `
        for supervisor in `cat $SUPERVISOR_HOST_CONF`
	do
	    echo $supervisor: stop supervisor
	    ssh $supervisor $STORM_HOME/bin/stop-supervisor.sh
	done
    ;;
status)
	echo $HOSTNAME: nimbus status
	jps
        for supervisor in `cat $SUPERVISOR_HOST_CONF`
	do
	    echo $supervisor: supervisor status
	    ssh $supervisor jps
	done
    ;;
*)
	echo "Usage:  {start|stop|status}"
    ;;
esac


