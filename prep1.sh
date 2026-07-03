#!/bin/sh

set -x

sudo apt update
sudo apt install -y build-essential net-tools curl wget python3-dev python3-venv python3-pip openjdk-21-jdk apt-transport-https ca-certificates curl software-properties-common 
sudo apt -y dist-upgrade
sudo apt -y autoremove
sudo apt -y autoclean
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.10-dev python3.10 python3.10-venv
cd $HOME
python3.10 -m venv rally
echo "source $HOME/rally/bin/activate" >> $HOME/.bashrc
echo "export JAVA21_HOME=/usr/lib/jvm/java-21-openjdk-arm64" >> $HOME/.bashrc
sudo reboot
