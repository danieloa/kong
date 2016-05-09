# == Class: kong
#
# Puppet class to deploy and manage kong api management suit https://getkong.org/.
# + install.pp manages the installation of kong after pre-requisites validation
# + config.pp implements the configuration of kong. This is done via erb template
# + params.pp implements the basic params required, override them with your own values
# + service.pp implements the service file for systemctl
# 
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Dependencies
# this module depends on the following:
# + puppetlabs-stdlib
# + htpasswd
# === Examples
#
#  class { 'kong':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
# Daniel Ortega Aparicio <dan.ortega.aparicio@gmail.com>
#
# === Copyright
# Apache 2.0 License - feel free to contribute
#
class kong (
  $kong_version                   = $kong::params::version,
  $kong_deploy_custom_plugins     = $kong::params::kong_deploy_custom_plugins,
  $kong_custom_plugins            = $kong::params::kong_custom_plugins,
  $kong_nginx_working_dir         = $kong::params::kong_nginx_working_dir,
  $kong_proxy_listen              = $kong::params::kong_proxy_listen,
  $kong_proxy_listen_ssl          = $kong::params::kong_proxy_listen_ssl,
  $kong_admin_api_listen          = $kong::params::kong_admin_api_listen,
  $kong_cluster_listen            = $kong::params::kong_cluster_listen,
  $kong_cluster_listen_rpc        = $kong::params::kong_cluster_listen_rpc,
  $kong_ssl_cert_path             = $kong::params::kong_ssl_cert_path,
  $kong_ssl_key_path              = $kong::params::kong_ssl_key_path,
  $kong_dns_resolvers_available   = $kong::params::kong_dns_resolvers_available ,
  $kong_dns_resolver              = $kong::params::kong_dns_resolver,
  $kong_dns_resolvers_address     = $kong::params::kong_dns_resolvers_address,
  $kong_dns_resolvers_port        = $kong::params::kong_dns_resolvers_port,
  $kong_cluster                   = $kong::params::kong_cluster,
  $kong_advertise                 = $kong::params::kong_advertise,
  $kong_encrypt                   = $kong::params::kong_encrypt,
  $kong_database                  = $kong::params::kong_database,
  $kong_cassandra_contact_points  = $kong::params::kong_cassandra_contact_points,
  $kong_keyspace                  = $kong::params::kong_keyspace,
  $kong_timeout                   = $kong::params::kong_timeout,
  $kong_replication_strategy      = $kong::params::kong_replication_strategy,
  $kong_replication_factor        = $kong::params::kong_replication_factor,
  $kong_cassandra_datacenters     = $kong::params::kong_cassandra_datacenters,
  $kong_ssl_enabled               = $kong::params::kong_ssl_enabled,
  $kong_ssl_verify                = $kong::params::kong_ssl_verify,
  $kong_ssl_certificate_authority = $kong::params::kong_ssl_certificate_authority,
  $kong_cassandra_username        = $kong::params::kong_cassandra_username,
  $kong_cassandra_password        = $kong::params::kong_cassandra_password,
  $kong_send_anonymous_reports    = $kong::params::kong_send_anonymous_reports,
  $kong_memory_cache_size         = $kong::params::kong_memory_cache_size,
  $kong_usr_apimgt                = $kong::params::kong_usr_apimgt,
  $kong_pwd_apimgt                = $kong::params::kong_pwd_apimgt,
  $kong_pwd_encrypt               = $kong::params::kong_pwd_encrypt,
  $kong_pwd_encrypt_type          = $kong::params::kong_pwd_encrypt_type,

) inherits kong::params {

  validate_string($kong_version)
  validate_bool($kong_deploy_custom_plugins)
  validate_array($kong_custom_plugins)
  validate_absolute_path($kong_nginx_working_dir)
  validate_string($kong_proxy_listen)
  validate_string($kong_proxy_listen_ssl)
  validate_string($kong_admin_api_listen)
  validate_string($kong_cluster_listen)
  validate_string($kong_cluster_listen_rpc)
  if $kong_ssl_cert_path { validate_absolute_path($kong_ssl_cert_path) }
  if $kong_ssl_key_path  { validate_absolute_path($kong_ssl_key_path)  }
  validate_bool($kong_dns_resolvers_available)
  validate_string($kong_dns_resolver)
  validate_string($kong_dns_resolver_address)
  validate_string($kong_dns_resolvers_port)
  validate_bool($kong_cluster)
  validate_string($kong_advertise)
  validate_string($kong_encrypt
  validate_string($kong_database)
  validate_array($kong_cassandra_contact_points)
  validate_string($kong_keyspace)
  validate_string($kong_timeout)
  validate_string($kong_replication_strategy)
  validate_string($kong_replication_factor)
  validate_string($kong_cassandra_datacenters
  validate_bool($kong_ssl_enabled)
  validate_bool($kong_ssl_verify)
  if $kong_ssl_certificate_authority { validate_absolute_path($kong_ssl_certificate_authority) }
  validate_string($kong_cassandra_username)
  validate_string($kong_cassandra_password)
  validate_bool($kong_send_anonymous_reports)
  validate_string($kong_memory_cache_size)
  validate_string($kong_usr_apimgt)
  validate_string($kong_pwd_apimgt)
  validate_bool($kong_pwd_encrypt)
  validate_string($kong_pwd_encrypt_type)

  notice('kong module being deployed')

  anchor { 'kong::begin': }   ->
  class {'::kong::install': } ->
  class {'::kong::config': }  ->
  class {'::kong::service': } ->
  anchor {'kong::end': }

}
