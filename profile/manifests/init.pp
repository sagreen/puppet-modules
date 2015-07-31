# == Class: profile
#
# Module to manage profile
#
class profile (

) {
class profile::puppetdb {
   include puppetdb
   include puppetdb::master::config
}
  # potentially include/require other modules

  # validate all params

}
