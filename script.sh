#!/bin/bash


CORES=4

# ---------------------------------------
# ----------{  Installation  }-----------
# ---------------------------------------


# install standard dependencies

# libopenmpi-dev and libgsl-dev - need always
sudo apt-get install -y  \
     git vim nano curl   \
     htop make           \
     libopenmpi-dev      \
     libgsl-dev g++

# start of editing rc file
cat <<EOT >> ~/.bashrc
# env var persist
export DEBIAN_FRONTEND=noninteractive
EOT
# end of editing rc file

# activating rc file
source ~/.bashrc

# install dependencies which need in some cases

# if python3 not found
sudo apt-get install -y python3

# if pip not found
sudo apt-get install -y pip

# python = python3 if python not found
sudo apt-get install -y python-is-python3

# faster Fourier transform in the West
sudo apt-get install -y fftw3

# Hierarchical Data Format
sudo apt-get install -y libhdf5-dev

# The hardware locality library
sudo apt-get install -y hwloc

# for gmp.h
sudo apt-get install -y libgmp-dev


# create lib dir
mkdir ~/codes
cd ~/codes
git clone https://gitlab.com/astromodel/libraries/arepo.git
cd arepo/
echo 'SYSTYPE="Ubuntu"' > Makefile.systype
cp Template-Config.sh Config.sh

make -j $(CORES)

#if you need for py
#sudo pip install "numpy<1.24" h5py