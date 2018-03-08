#!/bin/bash

# This script installs the ETSI G5 implementation
cd /home/vagrant
if [ ! -d $"vanetza" ]; then
  git clone https://github.com/riebl/vanetza.git
  cd vanetza/

  mkdir build && cd build
  cmake ..
  make
fi
