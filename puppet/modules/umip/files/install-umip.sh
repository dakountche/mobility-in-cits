#!/bin/bash

cd /home/vagrant
if [ ! -d $"umip" ]; then
  git clone git@github.com:dakountche/umip.git
  cd umip/
  git checkout dev
  #wget http://umip.org/contrib/patchs/umip-1.0-mcoa-dsmip6.patch
  #patch -p1 < umip-1.0-mcoa-dsmip6.patch

  /usr/bin/autoreconf -i
  ./configure --enable-vt
  make
  sudo make install
fi
