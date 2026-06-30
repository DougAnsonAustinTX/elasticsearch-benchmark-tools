#!/bin/sh

set -x
sudo systemctl stop elasticsearch
sudo rm -rf /var/lib/elasticsearch/*
sudo rm -rf /var/log/elasticsearch/*
sudo systemctl start elasticsearch
sudo /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic -i
