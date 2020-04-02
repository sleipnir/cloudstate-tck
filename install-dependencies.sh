#!/bin/bash

apt-get install -y git-core curl build-essential openssl libssl-dev python

wget https://github.com/google/protobuf/releases/download/v2.6.1/protobuf-2.6.1.tar.gz
tar xzf protobuf-2.6.1.tar.gz
cd protobuf-2.6.1

./configure
make
make check
make install 
ldconfig
protoc --version

cd /
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh -o install_nvm.sh
chmod +x install_nvm.sh
/install_nvm.sh
source ~/.profile
nvm install 10.9.0
node -v

curl -L https://npmjs.org/install.sh | sudo sh
npm -v

