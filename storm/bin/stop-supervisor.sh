#!/bin/bash
kill -9 `jps | grep supervisor|awk '{print $1}' `
