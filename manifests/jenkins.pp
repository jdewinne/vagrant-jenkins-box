# Install Jenkins

class jenkins {
    include apt

    apt::key { 'jenkins':
      key        => 'D50582E6',
      key_source => 'http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key',
    }

    apt::source {
      'jenkins':
        location   => 'http://pkg.jenkins-ci.org/debian binary/',
        release    => '',
        repos      => '',
        key        => 'D50582E6',
        key_server => 'pgp.mit.edu',
        include_src => false
    }

    package {
      'jenkins':
        ensure  => installed,
        require => Apt::Source['jenkins'],
    }

    service {
      'jenkins':
        ensure  => running,
        enable  => true,
        require => Package['jenkins'],
    }
}

class git {
  package { 'git-core': 
    ensure => installed
  }

}
  
# Note: maven class is not actually used currently
class maven {
  package { 'maven2':
    ensure => present
  }

}

include git
include jenkins
