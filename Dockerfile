FROM openjdk:8u131-jre-alpine
LABEL maintainer="contact@beefbytes.com"

RUN apk add -U \
          ca-certificates \
          openssl \
          lsof \
          su-exec \
          bash \
          curl iputils wget \
          mysql-client \
          vim \
          unzip \
          python python-dev py2-pip && \
        rm -rf /var/cache/apk/*

RUN addgroup -g 1000 mc \
    && adduser -Ss /bin/false -u 1000 -G mc -h /home/mc mc

WORKDIR /home/mc/server/
COPY common .

RUN wget "https://dl.gmodhq.com/mc/moopack_mods.zip" \
	&& unzip moopack_mods.zip \
	&& mv moopack_mods/* . \
	&& rm -r moopack_mods.zip moopack_mods

USER root
RUN chown -R mc:mc /home/mc \
    && chmod -R 774 /home/mc
USER mc

ENV DOCKER_MAX_PLAYERS="100" \
    DOCKER_PORT="25565" \
    DOCKER_VIEW_DISTANCE="3" \
    DOCKER_MAX_RAM="3G"
	
VOLUME ["/home/mc/server"]

CMD ["bash", "start.sh"]