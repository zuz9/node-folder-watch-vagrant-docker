This project use the docker node image as the base for doing NodeJS development on local machine but running it in linux vm to make sure your dev enviornment is the same as other enviornments.

You must install vagrant https://www.vagrantup.com/

"vagrant up" will start a docker container running supervisor watching for changes in your local (osx/pc) project.  

**Instructions**

Just copy this vagrant file in your current project root make sure your package.json file has this below 
you might want to "npm install supervisor -g" so you can run it local with "npm start"

1. "start": "supervisor server.js"
2. your project runs in port 3000

**Notes**

Currently the vagrant file exposes port 3000 from the docker container from node project and to the host. so
http://localhost:3000 on your mac or PC will bring up the containers website. You can change the localhost port by changing the vagrant file but you must build your own dockerfile and update references if you want to change your node project port.

----  notes below on other stuff ----

-- run manually
docker run --name dev -it -p 3000:3000 -v '/vagrant:/project' zuz9/node-folder-watch

-- testing
curl localhost:3000 # verify it is working
docker exec -it dev bash # enter container to see what is happening

-- build and push to docker hub
vagrant ssh
cd /vagrant
docker build -t zuz9/node-folder-watch .
docker login --username zuz9 --email
docker push zuz9/node-folder-watch
