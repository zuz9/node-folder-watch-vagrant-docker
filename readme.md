This project use the docker node image as the base for NodeJS development on local machine.

vagrant up will start a docker container running forever watching for changes.  Just place this vagrant file in your current project root and you must have server.js as your entry point.  You can change this by changing the docker file and creating a new image and referencing this new image in the vagrant file.


----  notes below on other stuff ----

-- run manuall
docker run --name dev -d -it -p 3000:3000 -v '/vagrant:/project' zuz9/node-forever

-- testing
curl localhost:3000 # verify it is working
docker exec -it dev bash # enter container to see what is happening

-- build and push to docker hub
cd /vagrant
docker build -t zuz9/node-forever .
docker login --username zuz9 --email
docker push zuz9/node-forever
