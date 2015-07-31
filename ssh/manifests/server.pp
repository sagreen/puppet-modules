class ssh::server inherits ssh {

  package { 'openssh_server_package':
    ensure => present,
    name   => 'openssh-server',
  }

  file { 'openssh_server_config':
    ensure  => file,
    path    => '/etc/ssh/sshd_config',
    require => Package['openssh_server_package'],
  }

  Service['openssh_service'] {
    ensure => running,
    enable => true,
    subscribe => File['openssh_server_config'],
  }

}
