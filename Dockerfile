FROM debian:jessie

ADD image /usr/local/bin
RUN install.sh && rm /usr/local/bin/install.sh
ENTRYPOINT ["validate_inputs.sh"]
