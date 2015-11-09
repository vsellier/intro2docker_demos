FROM debian

RUN apt-get update && apt-get -y install netcat redis-tools

COPY my_simple_app.sh /myapp.sh

RUN chmod u+x /myapp.sh && mkdir /var/log/myapp /opt/myapp

EXPOSE 9999
ENV PORT 9999

ENTRYPOINT ["/myapp.sh"]

VOLUME "/var/log/myapp"

LABEL name=demo5_1
