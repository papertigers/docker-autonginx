FROM nginx:latest
MAINTAINER Michael Zeller <mike.zeller@joyent.com>

RUN apt-get update && apt-get install -y supervisor curl
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /proxy-watcher
ADD proxy-watcher /proxy-watcher
RUN npm install

EXPOSE 80
CMD ["/usr/bin/supervisord"]
