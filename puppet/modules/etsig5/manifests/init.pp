# == Class: ETSI G5
#
# Installs packages for ETSI G5
#

class etsig5 {


package { 'cmake':
  ensure => installed,
  name => cmake,
}

package { 'libboost-dev':
   ensure => installed,
   name => libboost-dev,
}

package { 'libgeographic-dev':
  ensure => installed,
  name => libgeographic-dev,
}


package { 'libcrypto++-dev':
  ensure => installed,
  name => libcrypto++-dev,
}

package { 'libgps-dev':
  ensure => installed,
  name => libgps-dev,
}

file {
   '/usr/local/bin/install-vanetza.sh':
     source => 'puppet:///modules/etsig5/install-umip.sh',
     owner => 'vagrant',
     mode => 'ug+x',
     group => 'vagrant';
 }

 exec {
   'install-vanetza.sh':
    command => '/usr/local/bin/install-vanetza.sh',
 }

}
