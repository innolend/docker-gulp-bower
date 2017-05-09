# Pull base image.
FROM node:7.9.0-alpine

COPY packages.list /opt/packages.list

# Install dependencies
RUN apk update && \
    apk add alpine-sdk make python && \
    apk add --quiet --no-cache bash git && \
    yarn global add bower gulp && \
    yarn cache clean && \
    yarn add --force node-sass && \
    rm -rf /var/cache/* /tmp/* && mkdir /opt/offline && \
    cd /opt/offline && wget -i /opt/packages.list && \
    yarn config set yarn-offline-mirror /opt/offline && \
    yarn config set yarn-offline-mirror-pruning true

# Define working directory.
WORKDIR /opt/project