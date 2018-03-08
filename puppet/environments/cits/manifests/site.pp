# Ensures the common modules are installed
stage { 'pre':
  before => Stage['main']
}

# add the common module to the new 'pre' run stage
class { 'common':
  stage => 'pre'
}

# set defaults for file ownership/permissions
File {
  owner => 'root',
  group => 'root',
  mode  => '0644',
}

# all boxes inherit the common module
include common

node 'ha' {
  include homeagent
}

node  'mr' {
  include mobilerouter
}

node 'itssr' {
  include router
}

node 'itssr2' {
  include router
}


node 'cn' {
   include etsig5
}

node 'apu' {
     include etsig5
}
