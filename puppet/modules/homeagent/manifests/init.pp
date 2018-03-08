# == Class: homeagent
#
# Installs packages for homeagent
#

class homeagent  {


 require umip
 require ipsec

 file {
    '/usr/local/etc/mip6d.conf':
      source => "puppet:///modules/homeagent/mip6d.conf",
      owner => 'root',
      group => 'root';
  }


   file {
      '/etc/init.d/mip6d':
        source => 'puppet:///modules/homeagent/mip6d',
        owner => 'root',
        mode => 'ug+x',
        group => 'root';
    }

    file {
       '/etc/mip6d.conf.d':
         source => "puppet:///modules/homeagent/mip6d.conf.d",
         ensure => directory,
         recurse => true,
         owner => 'root',
         group => 'root';
     }



     file {
        '/etc/ipsec.conf.d':
          source => "puppet:///modules/homeagent/ipsec.conf.d",
          ensure => directory,
          recurse => true,
          owner => 'root',
          group => 'root';
      }

      file {
         '/etc/ipsec.d':
           source => "puppet:///modules/homeagent/ipsec.d",
           ensure => directory,
           recurse => true,
           owner => 'root',
           group => 'root';
       }

file {
  '/etc/sysctl.conf':
    owner => 'root',
    group => 'root',
    #mode  => '0644',
    source => "puppet:///modules/homeagent/sysctl.conf";
}


file {
  '/etc/radvd.conf':
    owner => 'root',
    group => 'root',
    #mode  => '0644',
    source => 'puppet:///modules/homeagent/radvd.conf';
}

file {
  '/etc/ipsec.conf':
    owner => 'root',
    group => 'root',
    #mode  => '0644',
    source => 'puppet:///modules/homeagent/ipsec.conf';
}


file {
  '/etc/ipsec.secrets':
    owner => 'root',
    group => 'root',
    #mode  => '0644',
    source => 'puppet:///modules/homeagent/ipsec.secrets';
}

service { 'radvd':
  ensure  => running,
  require => Package['radvd'];
}

service { 'ipsec':
  ensure  => running,
  require => Package['strongswan'];
}


service { 'strongswan':
  ensure  => running,
  require => Package['strongswan'];
}

}
