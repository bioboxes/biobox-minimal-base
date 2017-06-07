#!/bin/bash

set -o errexit
set -o nounset
set -o xtrace

PACKAGES="ca-certificates wget xz-utils"

apt-get update --yes
apt-get install --yes --no-install-recommends ${PACKAGES}


#
# Used to convert input biobox.yaml files from YAML to JSON when using jq
#
wget --quiet 'https://github.com/bronze1man/yaml2json/raw/master/builds/linux_386/yaml2json'
chmod a+xr yaml2json
mv yaml2json /usr/local/bin


#
# Used to ensure input biobox.yaml files are valid
#
wget --quiet --output-document -\
      'https://s3-us-west-1.amazonaws.com/bioboxes-tools/validate-biobox-file/0.x.y/validate-biobox-file.tar.xz' \
    | tar xJf - --directory /root
mv /root/build/validate-biobox-file /usr/local/bin
rm -rf /root/build

#
# jq is useful for pulling arguments from the biobox.yaml files with yaml2json
#
wget --quiet --output-document /usr/local/bin/jq \
	     'https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64'
chmod a+xr /usr/local/bin/jq

apt-get autoremove --purge --yes ${PACKAGES}
apt-get -q clean
rm -rf /var/lib/apt/lists/*
