
FROM teego/system:latest

MAINTAINER Aleksandr Zykov <tiger@mano.email>

ENV DEBIAN_FRONTEND noninteractive

RUN ( \
        apt-get update -q &&\
        apt-get upgrade -qy --no-install-recommends \
    ) && \
    apt-get clean -qy

RUN ( \
        apt-get install -qy --no-install-recommends \
            nginx-full \
            geoip-database \
            geoip-database-extra \
    ) && \
    apt-get clean -qy

EXPOSE 80 443

CMD ["/usr/sbin/nginx" "-g" "daemon off;"]
