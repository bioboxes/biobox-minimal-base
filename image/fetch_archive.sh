#!/bin/bash

mkdir -p /usr/local/$2
TMP=$(mktemp)
wget $1 --quiet --output-document ${TMP}
tar xf ${TMP} --directory /usr/local/$2 --strip-components=1
rm ${TMP}
