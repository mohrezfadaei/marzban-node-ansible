Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"

    config.vm.hostname = "ansible-test"
    config.vm.network "private_network", type: "dhcp"
    config.vm.synced_folder ".", "/vagrant"
    config.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y python3 python3-pip openssh-server
      pip3 install ansible
      systemctl enable ssh
      systemctl start ssh
    SHELL

    config.ssh.insert_key = false
    config.ssh.forward_agent = true

    config.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh"

    # Provision with Ansible
    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbooks/site.yml"
      ansible.inventory_path = "inventory/test.yml"
      ansible.extra_vars = {
        ansible_ssh_private_key_file: "~/.ssh/id_rsa"
      }
      ansible.ask_vault_pass = true
    end
  end
