#basic demonstration of using hiera data with sudo/ssh/motd/ntp modules

class sysop {
  include sudo

  sudo::conf { 'operations':
    priority => 20,
    content  => "%sysops ALL=(ALL) ALL\n"
  }

  sudo::conf { 'vagrant_group':
    priority => 10,
    content  => "%vagrant ALL=(ALL) NOPASSWD: ALL\n"
  }

  group { [ 'sysops', 'bob', 'anne' ]:
    ensure => 'present',
  }

  user { 'bob':
    ensure   => 'present',
    password => '$6$oMHSukkR$RJzBNZu10V04/m05q/aER4qco5JBZAJszTRMeReiSPz0xjA.YFaJC6UTsBcMpl3QqqblO7xro8dChLkGL5lDs0',
    gid      => "bob",
    home     => "/home/bob",
    groups   => [ 'sysops' ],
    shell    => '/bin/bash',
    before   => File["/home/bob"],
  }
  
  user { 'anne':
    ensure   => 'present',
    password => '$6$oMHSukkR$RJzBNZu10V04/m05q/aER4qco5JBZAJszTRMeReiSPz0xjA.YFaJC6UTsBcMpl3QqqblO7xro8dChLkGL5lDs0',
    gid      => "anne",
    home     => "/home/anne",
    groups   => [ 'sysops' ],
    shell    => '/bin/bash',
    before   => File["/home/anne"],
  }

  file { '/home/anne':
    ensure => 'directory',
    mode   => '0660',
    owner  => 'anne',
    group  => 'anne',
  }

  file { '/home/bob':
    ensure => 'directory',
    mode   => '0660',
    owner  => 'bob',
    group  => 'bob',
  }

}
