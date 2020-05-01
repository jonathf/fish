#!/bin/bash

# Script for installing Fish Shell on systems without root access.
# Fish Shell will be installed in $HOME/.local/bin.
# It's assumed that wget and a C/C++ compiler are installed.

FISH_VERSION=3.1.2

# create our directories
mkdir -p $HOME/.local $HOME/fish_shell_tmp
cd $HOME/fish_shell_tmp

# download source files for Fish Shell
wget https://github.com/fish-shell/fish-shell/releases/download/${FISH_VERSION}/fish-${FISH_VERSION}.tar.gz

# extract, configure and compile
tar xvzf fish-${FISH_VERSION}.tar.gz
cd fish-${FISH_VERSION}

mkdir build; cd build
cmake ..
make
make install/local
cp fish ~/.local/bin
