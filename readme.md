This project use the docker node image as the base for doing NodeJS development on local machine but running it in linux vm to make sure your dev enviornment is the same as other enviornments.

You must install vagrant https://www.vagrantup.com/

"vagrant up" will start a docker container running supervisor watching for changes in your local (osx/pc) project.  

###Instructions###

1. Just copy this "Vagrantfile" in this project into your current project root.
2. Make sure your package.json file has this "start": "supervisor server.js" * (see info below)
3. Make sure your node project runs in port 3000
4. In terminal cd to project root and type "vagrant up"

###Notes###

* step 2 above - this is important if you want it to monitor file changes for local development. You save you file on mac in you folder and docker container with web server restarts to show local changes.

You might want to "npm install supervisor -g" so you can run it local with "npm start"

Currently the vagrant file exposes port 3000 from the docker container from node project and to the host. so
http://localhost:3000 on your mac or PC will bring up the containers website. You can change the localhost port by changing the vagrant file but you must build your own dockerfile and update references if you want to change your node project port.

----  notes below on other stuff ----

**To  run manually **
docker run --name dev -it -p 3000:3000 -v '/vagrant:/project' zuz9/node-folder-watch

**Testing**

curl localhost:3000 # verify it is working

docker exec -it dev bash # enter container to see what is happening

###build and push to docker hub for Alex's use only :) ###

1. vagrant ssh
2. cd /vagrant
3. docker build -t zuz9/node-folder-watch .
4. docker login --username zuz9 --email
5. docker push zuz9/node-folder-watch
