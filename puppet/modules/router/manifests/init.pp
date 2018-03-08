# == Class: router
#
# Installs packages for router
#

class router {

package { 'radvd':
   ensure => installed,
   name => radvd,
}

package { 'quagga':
   ensure => installed,
   name => quagga,
}


file {
  '/etc/sysctl.conf':
    owner => 'root',
    group => 'root',
    #mode  => '0644',
    source => "puppet:///modules/router/sysctl.conf";
}


file {
  '/etc/radvd.conf':
    owner => 'root',
    group => 'root',
    #mode  => '0644',
    source => 'puppet:///modules/router/radvd.conf';
}

service { 'radvd':
  ensure  => running,
  require => Package['radvd'];
}

}
