FROM mhart/alpine-node

RUN apk add --update \
            build-base \
            python \
 && npm install -g bower gulp yarn \
 && rm /var/cache/apk/*

ENTRYPOINT /bin/sh
