#!/bin/bash


## Installing virtualbox
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" >> /etc/apt/sources.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install dkms
sudo apt-get install virtualbox-6.0

## Installing OVS
sudo apt-get install openvswitch-switch

## Adding switch to ovs
ovs-vsctl add-br br0
sudo ifconfig br0 172.16.1.1 netmask 255.255.255.0 up

## Installing Java
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

sudo apt-get install build-essential ant maven

## Installing git
apt install git

## Downloading floodlight project
git clone git://github.com/floodlight/floodlight.git
cd floodlight
git submodule init
git submodule update
ant

sudo apt-get install p7zip
wget https://drive.google.com/uc?export=download&confirm=oJvu&id=1hBI4H7hPFeD8xzaCA_c2N31RHhsOakyS
7z x debian-7.11.0-i386.7z
sudo apt-get install qemu-utils
qemu-img convert -O vdi debian-7.11.0-i386.qcow2 debian.vdi
## start the virtual machines using debian.vdi
## After the vm fires up, edit /etc/network/interfaces file to assign static ip to one of the interfaces.
## iface eth0 inet static
##    address 172.16.1.2
##    netmask 255.255.255.0
##    network 172.16.1.0
##    broadcast 10.0.0.255
##    gateway 172.16.1.1


java -jar target/floodlight.jar &
sudo ovs-vsctl set-controller br0 tcp:127.0.0.1:6653

## Visit the controller ui
## http://<controller-ip>:8080/ui/index.html
