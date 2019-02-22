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

ovs-vsctl add-br br0
ip tuntap add mode tap vnet0
ip link set vnet0 up
ovs-vsctl add-port br0 vnet0
ip link

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



java -jar target/floodlight.jar &
sudo ovs-vsctl set-controller br0 tcp:192.168.1.2:6653

