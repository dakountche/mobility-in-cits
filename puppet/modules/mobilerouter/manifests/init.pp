# == Class: Mobilerouter
#
# Installs packages for Mobilerouter
#

class mobilerouter {

require umip
require ipsec

file {
    '/usr/local/etc/mip6d.conf':
      source => "puppet:///modules/mobilerouter/mip6d.conf",
      owner => 'root',
      group => 'root';
}


  file {
     '/usr/local/etc/setkey.conf':
       source => 'puppet:///modules/mobilerouter/setkey.conf',
       owner => 'root',
       group => 'root';
   }


   file {
      '/etc/init.d/mip6d':
        source => 'puppet:///modules/mobilerouter/mip6d',
        owner => 'root',
        mode => 'ug+x',
        group => 'root';
    }


file {
  '/etc/sysctl.conf':
    owner => 'root',
    group => 'root',
    #mode  => '0644',
    source => "puppet:///modules/mobilerouter/sysctl.conf";
}


file {
  '/etc/radvd.conf':
    owner => 'root',
    group => 'root',
    #mode  => '0644',
    source => 'puppet:///modules/mobilerouter/radvd.conf';
}


file {
  '/etc/ipsec.conf':
    owner => 'root',
    group => 'root',
    #mode  => '0644',
    source => 'puppet:///modules/mobilerouter/ipsec.conf';
}


file {
  '/etc/ipsec.secrets':
    owner => 'root',
    group => 'root',
    #mode  => '0644',
    source => 'puppet:///modules/mobilerouter/ipsec.secrets';
}

file {
   '/etc/ipsec.d':
     source => "puppet:///modules/mobilerouter/ipsec.d",
     ensure => directory,
     recurse => true,
     owner => 'root',
     group => 'root';
 }

#service { 'radvd':
#  ensure  => running,
#  require => Package['radvd'];
#}

service { 'ipsec':
  ensure  => running,
  require => Package['strongswan'];
}

service { 'strongswan':
  ensure  => running,
  require => Package['strongswan'];
}

}
