# Pull base image.
FROM node:alpine

# Install dependencies
RUN apk add --quiet --no-cache bash git && \
    yarn global add bower gulp && \
    yarn cache clean && \
    rm -rf /var/cache/* /tmp/*

# Define working directory.
WORKDIR /workspace
