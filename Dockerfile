# Pull base image.
FROM node:alpine
ENV LIBSASS_VERSION=3.3.1 SASSC_VERSION=3.3.1

# Install dependencies
# RUN npm install --global yarn && \
RUN apk add --no-cache --virtual .build-deps alpine-sdk make python \
    ca-certificates \
    wget \
    tar && \
    cd /usr/local/bin && \
    wget https://yarnpkg.com/latest.tar.gz && \
    tar zvxf latest.tar.gz && \
    ln -s /usr/local/bin/dist/bin/yarn.js /usr/local/bin/yarn.js && \
    apk del .build-deps && mkdir /opt && mkdir /opt/project && apk add --no-cache python && \
    npm install -g async-foreach chalk cross-spawn gaze get-stdin glob in-publish lodash.assign lodash.clonedeep lodash.mergewith meow mkdirp nan node-gyp npmlog request sass-graph stdout-stream && \
    npm i -g gulp node-sass && npm link node-sass

ENV LIBSASS_VERSION=3.3.1 SASSC_VERSION=3.3.1

RUN npm install -g node-sass

# Define working directory.
WORKDIR /opt/project
