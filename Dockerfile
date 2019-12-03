FROM linuxserver/lidarr

RUN apt-get update && apt-get -y install -y python-pip jq moreutils php-cli

RUN pip install yq

COPY phpsed.php /
COPY 40-lidarrconfig /etc/cont-init.d

HEALTHCHECK --start-period=600s CMD curl -f http://lidarr:8686/lidarr || exit 1