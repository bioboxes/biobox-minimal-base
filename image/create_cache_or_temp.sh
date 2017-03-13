#!/bin/bash

set -o errexit

CACHE=$(biobox_args.sh 'select(has("cache")) | .cache | .value ')

if [[ $CACHE = "" ]];
then
        TEMP=$(mktemp -d)
else
        TEMP=$CACHE
fi

echo "$TEMP"
