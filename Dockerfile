FROM node
MAINTAINER Zuz9
RUN apt-get update
RUN npm install -g supervisor
RUN mkdir /project
WORKDIR /project
COPY server.js /project/server.js
COPY package.json /project/package.json
RUN cd /project
ENTRYPOINT npm start