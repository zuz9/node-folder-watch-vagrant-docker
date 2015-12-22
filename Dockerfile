FROM node
MAINTAINER Zuz9
RUN apt-get update
RUN npm install -g forever
RUN mkdir /project
WORKDIR /project
COPY server.js /project/server.js
RUN cd /project
CMD forever -w server.js