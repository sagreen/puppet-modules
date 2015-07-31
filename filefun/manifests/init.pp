# == Class: filefun
#
# Module to manage filefun
#
class filefun (

) {

  if $::filefun == 'present' {
  File {
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { '/tmp/test':
    ensure => directory,
  }

  file { '/tmp/test/one':
    ensure => file,
  }

  file { '/tmp/test/two':
    ensure => file,
  }

  file { '/tmp/test/link':
    ensure => link,
    target => '/tmp/test/one',
  }

  file { '/tmp/test/link2':
    ensure => link,
    target => '/tmp/test/two',
  }

  file { '/tmp/test/link3':
    ensure => link,
    target => 'three',
  }
    }
    elsif $::filefun == 'absent' {

  file { '/tmp/test':
    ensure => absent,
    force  => true,
  }

    }
    else {
      fail("filefun is <${::filefun}>. \$::filefun must be \'present\' or \'absent\'.")
    }
  }

  # potentially include/require other modules

  # validate all params
