# Pull base image.
FROM node:7.9.0-alpine

# Install dependencies
RUN apk update && \
    apk add alpine-sdk make python && \
    apk add --quiet --no-cache bash git && \
    yarn global add bower gulp && \
    yarn cache clean && \
    yarn add --force node-sass && \
    rm -rf /var/cache/* /tmp/*

# Define working directory.
WORKDIR /opt/projects
