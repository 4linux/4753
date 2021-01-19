# -*- mode: ruby -*-
# vi: set ft=ruby :

vms = {

  'Docker-workstation' => {'memory' => '1024', 'cpus' => 1, 'ip' => '1', 'box' => 'ubuntu/xenial64', 'provision' => 'docker-workstation.sh'},
  'IPA-server' => {'memory' => '2048', 'cpus' => 2, 'ip' => '1', 'box' => 'centos/7', 'provision' => 'ipa-server.sh'},
  'Linux-client' => {'memory' => '1024', 'cpus' => 2, 'ip' => '1', 'box' => 'centos/7', 'provision' => 'linux-client.sh'},
  'Samba-domain' => {'memory' => '2048', 'cpus' => 1, 'ip' => '1', 'box' => 'centos/7', 'provision' => 'samba-domain-controller.sh'},
  'Security-server' => {'memory' => '768', 'cpus' => 1, 'ip' => '1', 'box' => 'debian/stretch64', 'provision' => 'security-server.sh'},
  'Storage-server' => {'memory' => '1536', 'cpus' => 1, 'ip' => '1', 'box' => 'centos/7', 'provision' => 'storage-server.sh'}

}

Vagrant.configure('2') do |config|

  config.vm.box_check_update = false

  vms.each do |name, conf|
    config.vm.define "#{name}" do |my|
      my.vm.box = conf['box']
      my.vm.hostname = "#{name}.example.com"
      my.vm.network 'private_network', ip: "192.168.4.#{conf['ip']}"
      my.vm.provision 'shell', path: "provision/#{conf['provision']}"
      my.vm.provider 'virtualbox' do |vb|
        vb.memory = conf['memory']
        vb.cpus = conf['cpus']
      end
      my.vm.provider 'libvirt' do |lv|
        lv.memory = conf['memory']
        lv.cpus = conf['cpus']
        lv.cputopology :sockets => 1, :cores => conf['cpus'], :threads => '1'
      end
    end
  end

end
