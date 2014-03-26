# Provision your favorite development environment with Ansible

This vagrant file, provision.sh, and playbook allows you to provision your favorite development environment even if you are on Windows or behind proxy.


## Requirement

This vagrant file, provision.sh, and playbook expects the following tools are already installed.

- [Oracle VM VirtualBox 4.3.6](https://www.virtualbox.org/)
- [Vagrant 1.4.1](http://www.vagrantup.com/)

Git client is also needed. If you are on Windows, msysgit is preferred.

- [Git for Windows 1.9.0](http://msysgit.github.io/)


## How to use

Create and move to directory where you want to create the virtual machine, then download this playbook via git.

```
$ mkdir -p ~/vagrants/
$ cd ~/vagrants/
$ git clone https://github.com/garbagetown/ansible-provision-vagrant.git
```

If you are behind the proxy, configure your proxy host and port like below.

```
$ echo 'http_proxy: http://your.proxy.host:9999/' >> ansible-provision-vagrant/ansible/roles/proxy/vars/main.yml
```

Finally, dive into the directory and boot the virtual machine. **THIS PROCESS WILL TAKE A SEVERAL MINUTES**, please wait patiently.

```
$ cd ansible-provision-vagrant
$ vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
[default] Importing base box 'precise64'...
[default] Matching MAC address for NAT networking...
[default] Setting the name of the VM...
[default] Clearing any previously set forwarded ports...
[default] Clearing any previously set network interfaces...
[default] Preparing network interfaces based on configuration...
[default] Forwarding ports...
[default] -- 22 => 2222 (adapter 1)
[default] Booting VM...
[default] Waiting for machine to boot. This may take a few minutes...
DL is deprecated, please use Fiddle
[default] Machine booted and ready!
(snip)
The following NEW packages will be installed:
  ansible libyaml-0-2 python-crypto python-httplib2 python-jinja2
  python-markupsafe python-paramiko python-pkg-resources python-yaml
0 upgraded, 9 newly installed, 0 to remove and 159 not upgraded.
(snip)
Setting up libyaml-0-2 (0.1.4-2ubuntu0.12.04.2) ...
Setting up python-yaml (3.10-2) ...
Setting up python-crypto (2.4.1-1ubuntu0.1) ...
Setting up python-paramiko (1.7.7.1-2ubuntu1) ...
Setting up python-markupsafe (0.15-1) ...
Setting up python-jinja2 (2.6-1) ...
Setting up python-httplib2 (0.7.2-1ubuntu2.1) ...
Setting up ansible (1.4.4+dfsg-1~ubuntu12.04.1) ...
Setting up python-pkg-resources (0.6.24-1ubuntu1) ...
Processing triggers for libc-bin ...
ldconfig deferred processing now taking place
(snip)
PLAY [127.0.0.1] **************************************************************

GATHERING FACTS ***************************************************************
ok: [127.0.0.1]
(snip)
PLAY RECAP ********************************************************************
127.0.0.1                  : ok=25   changed=24   unreachable=0    failed=0
```

After the provisioning process has completed successfully, you can log in to the virtual machine using `vagrant ssh`.

```
$ vagrant ssh
Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.2.0-23-generic x86_64)

 * Documentation:  https://help.ubuntu.com/
Welcome to your Vagrant-built virtual machine.
Last login: Fri Sep 14 06:23:18 2012 from 10.0.2.2

# vagrant at precise64 in ~ [3:00:50]
$
```

Or using general ssh command to private network address which defined in Vagrantfile.

```
$ ssh vagrant@192.168.33.10
vagrant@192.168.33.10's password:
Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.2.0-23-generic x86_64)

 * Documentation:  https://help.ubuntu.com/
Welcome to your Vagrant-built virtual machine.
Last login: Thu Mar  6 03:00:49 2014 from 10.0.2.2

# vagrant at precise64 in ~ [3:02:16]
$
```

The password of vagrant is `vagrant`, as you know ;-)


## Provisioned environment

This vagrant file, provision.sh, and playbook provisions the following environment.

- Ubuntu 12.04.1 LTS x86_64
  - zsh
    - using oh-my-zsh and 'ys' theme
  - tmux
  - vim
  - git
  - tig

Of course Python and Ansible are installed, too!
