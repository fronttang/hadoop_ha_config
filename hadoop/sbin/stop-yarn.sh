#!/usr/bin/env bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# Stop all yarn daemons.  Run this on master node.

echo "stopping yarn daemons"

bin=`dirname "${BASH_SOURCE-$0}"`
bin=`cd "$bin"; pwd`

DEFAULT_LIBEXEC_DIR="$bin"/../libexec
HADOOP_LIBEXEC_DIR=${HADOOP_LIBEXEC_DIR:-$DEFAULT_LIBEXEC_DIR}
. $HADOOP_LIBEXEC_DIR/yarn-config.sh

# stop resourceManager
RM_HOST_CONF=$RM_HOST_CONF
if [ $RM_HOST_CONF != ""  ]; then
	"$bin"/yarn-daemons.sh --config $YARN_CONF_DIR --hosts $RM_HOST_CONF  stop resourcemanager
else
	"$bin"/yarn-daemon.sh --config $YARN_CONF_DIR stop resourcemanager
fi
#"$bin"/yarn-daemon.sh --config $YARN_CONF_DIR  stop resourcemanager
# stop nodeManager
"$bin"/yarn-daemons.sh --config $YARN_CONF_DIR  stop nodemanager
# stop proxy server
#"$bin"/yarn-daemon.sh --config $YARN_CONF_DIR  stop proxyserver
