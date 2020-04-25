#!/bin/bash

# Script for installing Fish Shell on systems without root access.
# Fish Shell will be installed in $HOME/.local/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

FISH_VERSION=3.1.0

# create our directories
mkdir -p $HOME/.local $HOME/fish_shell_tmp
cd $HOME/fish_shell_tmp

# download source files for Fish Shell
wget http://fishshell.com/files/${FISH_VERSION}/fish-${FISH_VERSION}.tar.gz

# extract, configure and compile
tar xvzf fish-${FISH_VERSION}.tar.gz
cd fish-${FISH_VERSION}
./configure --prefix=$HOME/.local --disable-shared
make
make install
