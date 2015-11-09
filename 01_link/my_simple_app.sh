#!/bin/bash

LOG_FILE=/var/log/myapp/myapp.log

function read_value {
  result=$(nc -l -p $PORT)
}

function work_hard {
  sleep 1
}

function save_value {
  echo ${result} >> /opt/myapp/result.csv
}

function log_read_value {
  echo "$(date) $(hostname) INFO received_value=${result}" >> ${LOG_FILE}
}

function log_computed_value {
  echo "$(date) $(hostname) INFO value computed " >> ${LOG_FILE}
}

touch ${LOG_FILE}
tail -F /var/log/myapp/myapp.log &
while true
do
  read_value
  log_read_value
  work_hard
  log_computed_value
  save_value
done
