#!/bin/bash
## test
##
##
##

LOG_FILE=/var/log/myapp/myapp.log

function read_value {
  result=$(nc -l -p $PORT)
}

function work_hard {
  sleep 1
}

function save_value {
  ####
  ####
  position=$(redis-cli -h ${REDIS_HOST} RPUSH my_values "$result")
  ####
  ####
}


function log_read_value {
  echo "$(date) $(hostname) INFO received_value=${result}" >> ${LOG_FILE}
}

function log_computed_value {
  echo "$(date) $(hostname) INFO value computed " >> ${LOG_FILE}
}

function log_result_saved {
  echo "$(date) $(hostname) INFO value saved at position ${position} " >> ${LOG_FILE}
}

touch ${LOG_FILE}
tail -F /var/log/myapp/myapp.log &
echo "Date will be stored in redis ${STORAGE_ENV_REDIS_VERSION}"
while true
do
  read_value
  log_read_value
  work_hard
  log_computed_value
  save_value
  log_result_saved
done
