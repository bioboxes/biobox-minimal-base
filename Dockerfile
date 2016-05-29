FROM debian:8.4

ENV PACKAGES \
	ca-certificates \
	wget \
	xz-utils

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends ${PACKAGES} && \
    apt-get -q clean && \
    rm -rf /var/lib/apt/lists/*

#
# Used to convert input biobox.yaml files from YAML to JSON when using jq
#
RUN wget --quiet 'https://github.com/bronze1man/yaml2json/raw/master/builds/linux_386/yaml2json' && \
    chmod 700 yaml2json && \
    mv yaml2json /usr/local/bin

#
# Used to ensure input biobox.yaml files are valid
#
RUN wget \
      --quiet \
      --output-document -\
      'https://s3-us-west-1.amazonaws.com/bioboxes-tools/validate-biobox-file/0.x.y/validate-biobox-file.tar.xz' \
    | tar xJf - --directory /root && \
      mv /root/build/validate-biobox-file /usr/local/bin && \
      rm -rf /root/build

#
# jq is useful for pulling arguments from the biobox.yaml files with yaml2json
# Version 1.5 is however not available in debian:8.4
#
RUN wget \
      --quiet \
      --output-document /usr/local/bin/jq \
      'https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64' \
      ${JQ} && \
    chmod 500 /usr/local/bin/jq
