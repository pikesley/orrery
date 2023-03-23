FROM docker.io/ubuntu

ARG PROJECT
WORKDIR /opt/${PROJECT}

COPY ./ /opt/${PROJECT}

RUN apt-get -y update && apt-get install -y nginx vim  

RUN ln -sf /opt/${PROJECT}/nginx/site.conf /etc/nginx/sites-enabled/default

COPY ./container-config/entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint"]
