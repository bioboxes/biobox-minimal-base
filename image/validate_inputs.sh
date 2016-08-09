#!/bin/bash

set -o errexit
set -o nounset

# Validate the biobox.yaml file before doing anything else
validate-biobox-file --schema ${SCHEMA} --input /bbx/input/biobox.yaml

${BIOBOX_EXEC} $*
