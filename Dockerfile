FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install apache2

RUN apt-get install -y git python

RUN git clone 'https://github.com/bossofmerced/masterofjenkins'

WORKDIR masterofjenkins

# Configure apache
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
    echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
    echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \ 
    echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \ 
    chmod 755 /root/run_apache.sh

EXPOSE 80

# Running hax, that's why <3 python :)
RUN /usr/bin/python -c 'from Hello import run_code; header = "<html><head><h1>" + run_code() + "</h1></head></html>"; fh = open("index.html", "w"); fh.write(header)'

RUN cp index.html /var/www/html/

CMD /root/run_apache.sh

