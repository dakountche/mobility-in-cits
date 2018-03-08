# == Class: umip
#
# Installs packages for umip
#

class umip {

package { 'git':
  ensure => installed,
  name => git,
}

package { 'quagga':
   ensure => installed,
   name => quagga,
}

package { 'autoconf':
  ensure => installed,
  name => autoconf,
}


package { 'dh-autoreconf':
  ensure => installed,
  name => dh-autoreconf,
}


package { 'automake':
  ensure => 'installed',
  name => 'automake',
}

package { 'bison':
  ensure => 'installed',
  name => 'bison',
}

package { 'flex':
  ensure => 'installed',
  name => 'flex',
}

package { 'libssl-dev':
  ensure => 'installed',
  name => 'libssl-dev';
}

package { 'indent':
  ensure => 'installed',
  name => 'indent',
}

package { 'ipsec-tools':
  ensure => 'installed',
  name => 'ipsec-tools',
}

package { 'fakeroot':
  ensure => 'installed',
  name => 'fakeroot',
}

package { 'radvd':
  ensure => 'installed',
  name => 'radvd',
}

package { 'linux-source':
  ensure => 'installed',
  name => 'linux-source',
}



file {
   '/usr/local/bin/install-umip.sh':
     source => 'puppet:///modules/umip/install-umip.sh',
     owner => 'vagrant',
     mode => 'ug+x',
     group => 'vagrant';
 }


 exec {
   'install-umip.sh':
    command => '/usr/local/bin/install-umip.sh',
    require => Package['bison', 'dh-autoreconf'],
 }


}
