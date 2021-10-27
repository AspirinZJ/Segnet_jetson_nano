#!/bin/bash

set -e

sudo apt install git cmake libpython3-dev python3-numpy -y
cd ~
cp segnet.py ~
git clone --recursive git@github.com:dusty-nv/jetson-inference.git
cd jetson-inference
mkdir build && cd build
cmake ..
make -j3
sudo make install
sudo ldconfig

cd ~
./segnet.py --network=fcn-resnet18-cityscapes-1024x512 /dev/video0

