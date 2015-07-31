# == Class: mailalias
#
# Module to manage mailalias
#
class mailalias (
  $root = 'root',
  $mail_aliases_path = '/etc/aliases',
  $rebuild_command = 'newaliases',

) {

file { 'aliases':
ensure  => file,
path    => '/etc',
content => template ('mailalias/aliases.erb'),
notify  => Exec['genaliases'],
}
exec { 'genaliases':
command => 'newaliases',
path => '/bin:/usr/bin:/usr/local/bin',
refreshonly => true,
}

  # potentially include/require other modules

  # validate all params

}
