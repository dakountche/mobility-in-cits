class common {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
  }

  exec { 'apt-get upgrade':
    command => '/usr/bin/apt-get upgrade --yes';
  }

  package { 'build-essential':
    ensure => installed,
    name => build-essential,
  }

  package { 'tcpdump':
    ensure => installed,
    name => tcpdump,
  }

  package { 'iperf':
    ensure => installed,
    name => iperf,
  }


file {
  '/home/vagrant/.bashrc':
    owner => 'vagrant',
    group => 'vagrant',
    mode  => '0644',
    source => 'puppet:///modules/common/bashrc';
}
}
