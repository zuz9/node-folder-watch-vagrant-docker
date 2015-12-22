FROM node
RUN apt-get update
RUN npm install -g forever
RUN mkdir /project
WORKDIR /project

COPY server.js /project/server.js
RUN cd /project

CMD forever -w server.js
#CMD bash

#notes below on other stuff...
#docker build -t zuz9/node-forever .
# docker login --username zuz9 --email
# docker run --name dev -d -it -p 3000:3000 -v '/vagrant:/project' zuz9/node-forever
# curl localhost:3000
# docker exec -it dev bash
