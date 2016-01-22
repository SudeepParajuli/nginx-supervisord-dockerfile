FROM alpine:latest
RUN apk --update add \
  nginx \
  supervisor
RUN mkdir -p /etc/nginx

RUN mkdir -p /var/log/supervisor
RUN rm /etc/nginx/nginx.conf
ADD nginx.conf /etc/nginx/nginx.conf
COPY  default /etc/nginx/sites-enabled/default
ADD nginx-supervisor.ini /etc/supervisor.d/nginx-supervisor.ini
EXPOSE 80 9000
CMD ["/usr/bin/supervisord"]


