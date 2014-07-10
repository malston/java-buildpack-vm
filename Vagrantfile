# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.hostname = "java-buildpack-vm-berkshelf"

# Plugin-specific configurations
  # Detects vagrant-omnibus plugin
  if Vagrant.has_plugin?('vagrant-omnibus')
    puts 'INFO: Vagrant-omnibus plugin detected.'
    # Set the version of chef to install using the vagrant-omnibus plugin
    config.omnibus.chef_version = :latest
  else
    puts "FATAL: Vagrant-omnibus plugin not detected. Please install the plugin with\n 'vagrant plugin install vagrant-omnibus' from any other directory\n before continuing."
    exit
  end

  # Detects vagrant-berkshelf plugin
  if Vagrant.has_plugin?('berkshelf')
    puts 'INFO: Vagrant-berkshelf plugin detected.'

    # The path to the Berksfile to use with Vagrant Berkshelf
    # config.berkshelf.berksfile_path = "./Berksfile"

    # Enabling the Berkshelf plugin. To enable this globally, add this configuration
    # option to your ~/.vagrant.d/Vagrantfile file
    config.berkshelf.enabled = true
  else
    puts "FATAL: Vagrant-berkshelf plugin not detected. Please install the plugin with\n 'vagrant plugin install vagrant-berkshelf' from any other directory\n before continuing."
    exit
  end

  # Every Vagrant virtual environment requires a box to build off of.
  #config.vm.box = "opscode-ubuntu-12.04"
  config.vm.box = "opscode_centos-6.5"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  #config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_ubuntu-12.04_chef-provisionerless.box"

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  #config.vm.network :private_network, type: "dhcp"
  config.vm.network :private_network, ip: "192.168.33.10"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.

  #config.vm.network :forwarded_port, guest: guest, host: 8080

  #config.vm.network :forwarded_port, guest: host, host: 9090
  config.vm.network(:forwarded_port, {:guest=>8080, :host=>9090, :auto_correct=>true})

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.
  config.vm.provider :virtualbox do |p, override|
    #override.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-12.04_chef-provisionerless.box"
    override.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box"
    p.customize ["modifyvm", :id, "--cpus", "2"]
    p.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provider :vmware_fusion do |p, override|
    #override.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_ubuntu-12.04_chef-provisionerless.box"
    override.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_centos-6.5_chef-provisionerless.box"
    p.customize ["modifyvm", :id, "--cpus", "2"]
    p.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :rbenv => {
        :group_users => ["vagrant"]
      }
    }

    #chef.add_recipe "yum::default"
    #chef.add_recipe "rbenv::ruby_build"
    #chef.add_recipe "java-buildpack-vm"

    chef.run_list = [
      "recipe[java-buildpack-vm::default]"
    ]

  end
end
