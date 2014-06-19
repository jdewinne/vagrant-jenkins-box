class platform {

  file { "/etc/timezone":
    content => "Etc/UTC",
    ensure => present,
  } 

  exec { "set-timezone":
    cwd => "/etc",
    command => "/usr/sbin/dpkg-reconfigure -f noninteractive tzdata",
    require => File["/etc/timezone"],
  }

}

Exec { path => [ "/bin", "/sbin" , "/usr/bin", "/usr/sbin" ] }
include platform

import "jenkins.pp"

