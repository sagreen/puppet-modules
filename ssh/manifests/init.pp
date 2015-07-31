# == Class: ssh
#
# Module to manage ssh
#
class ssh (

) {

  # potentially include/require other modules

  # validate all params
  package { 'openssh_client_package':
    ensure => present,
    name   => 'openssh-clients',
  }

  file { 'ssh_config':
    ensure  => file,
    path    => '/etc/ssh/ssh_config',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['openssh_client_package']
  }

  service { 'openssh_service':
    ensure => stopped,
    enable => false,
    name   => 'sshd',
  }
}
