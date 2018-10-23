######################################################
# ubuntu/trusty64 : basicOS
#   Note(s): Vagrant Templ. (sysprep)
#   Martin Darl-Larsen <martin@mpsoft.dk>
######################################################
# Parse options
options = {}
options[:boxname] = ARGV[1] || 'test-serv1'

if options[:boxname].nil?
  options[:boxname] = ARGV[1] || (0...10).map { ('a'..'z').to_a[rand(26)] }.join
  puts "You did not set a Boxname,  creating random: #{options[:boxname]}"
end

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "ubuntu/trusty64"
	config.vm.provider "virtualbox" do |v|
		v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
		v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
		v.customize ["modifyvm", :id, "--memory", "2048"]
		v.customize ["modifyvm", :id, "--cpus", "2"]
		v.customize ["modifyvm", :id, "--vram", "128"]
		
		#Set VM friendly name
		v.name = options[:boxname]
	end
	#Set the machine ID in .VM-DIR 
	config.vm.define options[:boxname]  
	#Set hostname in VM
	config.vm.hostname = options[:boxname]

	#config.vm.network :private_network, ip: "10.10.10.10"
	##config.vm.synced_folder "/Users/mdahl/SRC/MPS/Puppet/", "/etc/puppet"
	
	config.vm.provision "install-sw-and-tool",
	  type: "shell",
	  preserve_order: true,
	  inline: "gem install deep_merge ; apt-get install -yqq nfs-common portmap mc wget curl lynx less libguestfs-tools "
	#config.vm.provision "puppet-apply",
	#  type: "shell",
	#  preserve_order: true,
	#  inline: "puppet apply -v /etc/puppet/manifests/site.pp "
	
end
