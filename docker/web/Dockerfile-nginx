FROM nginx:1.14-alpine

WORKDIR /usr/src/app

COPY ./docker/web/webmil.conf /etc/nginx/conf.d/webmil.conf
RUN rm /etc/nginx/conf.d/default.conf

EXPOSE 80
