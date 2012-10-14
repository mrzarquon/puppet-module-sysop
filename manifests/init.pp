#basic demonstration of using hiera data with sudo/ssh/motd/ntp modules
#
#

class sysop {
  include motd
  include sudo
  include ssh
  include ntp


  sudo::conf { 'operations':
    priority => 10,
    content  => "%sysops ALL=(ALL)\n"
  }

  motd { 'defaultmotd':
    template => 'puppet-motd.erb',
  }

  ntp { 'defaultntp': }


}




