
FROM f69m/ubuntu32-runit

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
	apt-get -y install --no-install-recommends nginx && \
	apt-get clean && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*

COPY config/runit /etc/service

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

