#!/bin/bash

sudo ip -6 addr flush eth1
sudo ip address add fde4:8dba:82e1:2::2/64 dev eth1

sudo route add -A inet6 default gw fde4:8dba:82e1:2::1
