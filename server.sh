#!/bin/bash

docker images | grep camusic-prototype-server > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo -e "FROM httpd\n\
RUN apt update \\\\\n\
    && apt install -y openssl \\\\\n\
    && rm -rf /var/lib/apt/lists/* \\\\\n\
    && openssl req -new -x509 -nodes -out server.crt -keyout server.key -subj \"/C=JP/ST=State/L=Locality/O=Organization/OU=Organizational Unit/CN=Common Name\" \\\\\n\
    && mv server.crt /usr/local/apache2/conf/ \\\\\n\
    && mv server.key /usr/local/apache2/conf/ \\\\\n\
    && sed -i -e \"s/#Include conf\/extra\/httpd-ssl.conf/Include conf\/extra\/httpd-ssl.conf/g\" /usr/local/apache2/conf/httpd.conf \\\\\n\
    && sed -i -e \"s/#LoadModule socache_shmcb_module modules\/mod_socache_shmcb.so/LoadModule socache_shmcb_module modules\/mod_socache_shmcb.so/g\" /usr/local/apache2/conf/httpd.conf \\\\\n\
    && sed -i -e \"s/#LoadModule ssl_module modules\/mod_ssl.so/LoadModule ssl_module modules\/mod_ssl.so/g\" /usr/local/apache2/conf/httpd.conf" > camusic-prototype-server.dockerfile

    docker build -f camusic-prototype-server.dockerfile -t camusic-prototype-server .

    rm camusic-prototype-server.dockerfile
fi

docker run --rm -p 8080:80 -p 8443:443 -v `pwd`:/usr/local/apache2/htdocs:ro camusic-prototype-server
