FROM mhart/alpine-node

RUN apk add --update \
            build-base \
            python

RUN echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/main\nhttp://dl-cdn.alpinelinux.org/alpine/edge/community\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing' > /etc/apk/repositories
RUN apk update
RUN apk add --no-cache yarn

RUN npm install -g bower gulp \
 && rm /var/cache/apk/*

ENTRYPOINT /bin/sh

CMD ["/bin/sh"]
