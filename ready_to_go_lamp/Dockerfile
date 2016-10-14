FROM httpd:2
ENV config_path /home/test

VOLUME $config_path
COPY base_configuration /tmp/base
COPY entrypoint.sh /bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]