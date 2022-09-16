#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get install -y libcurl4-openssl-dev libssl-dev jq ruby-full libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev build-essential libssl-dev libffi-dev python2.7-dev python-setuptools libldns-dev python3-pip python-pip python-dnspython git rename findutils

pip install dnspython
