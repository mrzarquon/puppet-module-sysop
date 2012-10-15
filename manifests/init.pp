#basic demonstration of using hiera data with sudo/ssh/motd/ntp modules
#
#

class sysop {
  include ntp


  sudo::conf { 'operations':
    priority => 10,
    content  => "%sysops ALL=(ALL)\n"
  }

  user { 'bob':
    ensure   => 'present',
    password => '$1$3FWJFDq4$ZsOUBYyydVPByu6aHznKS0',
    home     => '/home/bob'
    groups   => [ 'bob', 'sysops' ],
    shell    => '/bin/bash',
  }
  user { 'cat':
    ensure   => 'present',
    password => '$1$3FWJFDq4$ZsOUBYyydVPByu6aHznKS0',
    home     => '/home/cat'
    groups   => [ 'cat', 'sysops' ],
    shell    => '/bin/bash',
  }
  
}




