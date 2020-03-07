# firebase-cli

![Docker Image Size (tag)](https://img.shields.io/docker/image-size/sharpmind/firebase-cli/latest)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/sharpmind/firebase-cli)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/sharpmind/firebase-cli)
![GitHub](https://img.shields.io/github/license/sharpmind-de/firebase-cli)

A node based docker image with firebase command line tools. It's basically designed to be used in CI systems like Jenkins.

## Usage

### firebase

Execute the firebase tool and use as specied on the firebase documenation home page: https://firebase.google.com/docs/cli

```
docker run sharpmind/firebase-cli firebase --help
```

### node / npm

As this image is based on node

```
FROM node::13-slim
```

node itself and npm are available as well. Node is the default command if no other command is specified.

```
docker run sharpmind/firebase-cli npm --help # running npm
docker run sharpmind/firebase-cli --help # running node
```

### shell

You can drop into a shell if specified as command.

```
docker run -it sharpmind/firebase-cli /bin/bash
# 
# which firebase
/home/node/.npm-global/bin/firebase
# which node
/usr/local/bin/node
# which npm
/usr/local/bin/npm
```

## License

[MIT License](http://en.wikipedia.org/wiki/MIT_License)