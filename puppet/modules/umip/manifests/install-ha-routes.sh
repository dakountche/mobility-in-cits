#!/bin/bash

sudo ip address add fde4:8dba:82e1:cafe::1/64 dev eth1 # Home Link

sudo ip address add fde4:8dba:82e1:2::1/64 dev eth2 # Internet (To the CN)

#sudo ip -6 route add fde4:8dba:82e1:f00d::/64 via fde4:8dba:82e1:cafe::2

sudo route add -A inet6 default gw fde4:8dba:82e1:cafe::3 # Default route: to the ITSS-R 
