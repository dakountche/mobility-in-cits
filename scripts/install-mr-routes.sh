#!/bin/bash

sudo ip address add fde4:8dba:82e1:cafe::2/64 dev eth2 # HoA

#sudo ip address add fde4:8dba:82e1:f00d::1/64 dev eth3 # MR Address in the Mobile Network
sudo ip address add 2001:db8:ffff:ff01::1/64 dev eth3 # MR Address in the Mobile Network

#sudo route add -A inet6 default gw fde4:8dba:82e1:1::1
