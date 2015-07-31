# == Class: debugger
#
# Module to manage debugger
#
class debugger (

) {

  # assignment
  $user = 'root'

  # facts are variables
  $banner = "Welcome to ${::fqdn}"

  # arrays
  $nameservers = [ '8.8.8.8',
  '8.8.4.4',
  ]

  notify { "user = <${user}>": }
  notify { "banner = <${banner}>": }
  notify { "nameservers = <${nameservers}>": }

  # potentially include/require other modules

  # validate all params

}
