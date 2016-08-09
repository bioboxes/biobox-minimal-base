#!/bin/bash

set -o errexit
set -o nounset

JSON_PATH=".arguments[] | $1"
INPUT=/bbx/input/biobox.yaml

yaml2json < ${INPUT} | jq  --raw-output "${JSON_PATH}"
