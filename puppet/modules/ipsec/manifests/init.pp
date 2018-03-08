# == Class: strongswan
#
# Installs packages for strongswan
#
class ipsec {
  package { ['strongswan']:
    ensure => installed;
  }

  package { ['strongswan-ikev2']:
    ensure => installed;
  }

}
