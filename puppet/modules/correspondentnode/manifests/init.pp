#
#
# Installs packages for the correspondent node
#

class correspondentnode {

package { 'nginx':
   ensure => installed,
   name => nginx,
}


service { 'nginx':
  ensure  => running,
  require => Package['nginx'];
}

}
