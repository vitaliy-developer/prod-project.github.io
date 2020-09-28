FROM ubuntu:20.04
MAINTAINER Vitaly DevOps

# install & configure nginx

RUN apt-get update && apt-get install -y nginx && \
mkdir -p /var/www/project-site/html
COPY . /var/www/project-site/html
COPY ./config_nginx/project-site /etc/nginx/sites-available/
COPY ./config_nginx/nginx.conf /etc/nginx/
COPY ./config_nginx/script_install_projecrt.sh /home/script_install_projecrt.sh
# RUN bash /home/script_install_projecrt.sh
RUN chown -R $USER:$USER /var/www/project-site/html && \
chmod -R 755 /var/www/project-site/html && \
ln -s /etc/nginx/sites-available/project-site /etc/nginx/sites-enabled/ && \
update-rc.d -f nginx enable && \
/etc/init.d/nginx start && \
nginx -t


# expose HTTP

EXPOSE 67

# Run

STOPSIGNAL SIGTERM
CMD ["nginx", "-g", "daemon off;"]
