FROM nginx

MAINTAINER Systems Engineer

WORKDIR /usr/share/nginx/html/

COPY . /usr/share/nginx/html/

EXPOSE 80

