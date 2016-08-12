#!/bin/bash

if [ ! -z "${BIOBOX_EXEC+}" ]; then
	echo "Internal biobox error: the required variable BIOBOX_EXEC is not set." >&2
	exit 1
fi

set -o errexit
set -o nounset

# Validate the biobox.yaml file before doing anything else
validate-biobox-file --schema ${SCHEMA} --input /bbx/input/biobox.yaml

# if /bbx/metadata is mounted create log.txt
if [ -d "${METADATA}" ]; then
  LOG=${METADATA}/log.txt
else
  LOG=/dev/null
fi

${BIOBOX_EXEC} $* &> ${LOG}
