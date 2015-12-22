Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provision "docker" do |d|
    d.run "zuz9/node-forever",
      #cmd: "bash",
      # remove the -d below if you want to watch forever restart with changes
      args: "--name dev -d -it -p 3000:3000 -v '/vagrant:/project'"
  end

  config.vm.network "forwarded_port", guest: 3000, host: 3000
end
