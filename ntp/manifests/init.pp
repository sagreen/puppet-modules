# == Class: ntp
#
# Module to manage ntp
#
class ntp (

  $ntp_servers = [ '0.us.pool.ntp.org',
  '1.us.pool.ntp.org',
  '2.us.pool.ntp.org' ],

  $key = '/etc/ntp/keys',

  $trustedkeys = [ '4',
                  '8',
                  '42' ],

  $ensure = 'present',
  $ntp_package = 'ntp',

  $ntp_service_ensure = 'running',
  $ntp_package_ensure = 'present',
  $ntp_config_file_ensure = 'file',

  $ntp_config_file = '/etc/ntp.conf',
  $ntp_config_file_owner = 'root',
  $ntp_config_file_group = 'root',
  $ntp_config_file_mode = '0644',

  $ntp_service_enable = 'true',
  $ntp_service_name = 'ntpd',

) {
  # potentially include/require other modules

validate_absolute_path ($key)
validate_re ($ensure, '^(present)|(absent)$', 'error error ensure is $<{ensure}> but must be <present> or <absent>')
validate_string ($ntp_package)

validate_string ($ntp_service_ensure)
validate_string ($ntp_package_ensure)
validate_string ($ntp_config_file_ensure)

validate_absolute_path ($ntp_config_file)
validate_string ($ntp_config_file_owner)
validate_string ($ntp_config_file_group)
validate_re ($ntp_config_file_mode, '^[0-7]{4}$', 'error error ntp_config_file_group is $<{ntp_config_file_group}> but must be an octal with lenght of 4')

validate_string ($ntp_service_enable)
validate_string ($ntp_service_name)

  if $::is_virtual == true {
    $tinker_panic =  'tinker panic 0'
  }

  case $ensure {
    'present': {
      $package_ensure_real = 'installed'
      $config_ensure_real  = 'file'
      $service_ensure_real = 'running'
      $service_enable_real = true
    }
    'absent': {
      $package_ensure_real = 'absent'
      $config_ensure_real  = 'absent'
      $service_ensure_real = 'stopped'
      $service_enable_real = false
    }
    default: {
      fail("ntp::ensure is <${ensure}> and valid values are \'present\' and \'absent\'.")
    }
  }

  # potentially include/require other modules

  # validate all params
  package { 'ntp_package':
    ensure => $ntp_package_ensure,
    name   => $ntp_package,
    before => File['ntp_config'],
  }

  file { 'ntp_config':
    ensure  => $ntp_config_file_ensure,
    path    => $ntp_config_file,
    content => template ('ntp/ntp.conf.erb'),
    owner   => $ntp_config_file_owner,
    group   => $ntp_config_file_group,
    mode    => $ntp_config_file_mode,
    notify  => Service['ntp_service'],
  }

  service { 'ntp_service':
    ensure => $ntp_service_ensure,
    enable => $ntp_service_enable,
    name   => $ntp_service_name,
  }

}
