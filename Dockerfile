ARG NODE_VERSION=13-slim

FROM node:$NODE_VERSION

LABEL authors="Marco Stolze <marco@sharpmind.de>"

# set user to avoid permission issues
# (see https://github.com/nodejs/node-gyp/issues/1236)
USER node
RUN mkdir /home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

# install Firebase CLI
RUN npm install -g firebase-tools

# reset user back to root
USER root
