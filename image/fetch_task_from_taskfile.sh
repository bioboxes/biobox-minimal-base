#!/bin/bash

set -o errexit

TASKFILE=$1
TASK=$2

# Use grep to get task in Taskfile
CMD=$(egrep "^$TASK: " $TASKFILE | cut -f 2 -d ':')
if [[ -z ${CMD} ]]; then
  echo "Abort, no matching task found for '$TASK'."
  exit 1
fi

# if /bbx/metadata is mounted create log.txt
if [ -d "${METADATA}" ]; then
  CMD="$CMD >& ${METADATA}/log.txt"
fi

echo "$CMD"
