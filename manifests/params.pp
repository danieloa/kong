# == Class: kong::params
#
# Params for class kong here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
#
#
# === Authors
# Daniel Ortega Aparicio <dan.ortega.aparicio@gmail.com>
#
# === Copyright
# Apache 2.0 License - feel free to contribute

class kong::params {
  $kong_version                   = '0.7.0-1'
  $kong_deploy_custom_plugins     = false
  $kong_custom_plugins            = []
  $kong_nginx_working_dir         = '/usr/local/kong/'
  $kong_proxy_listen              = '0.0.0.0:8000'
  $kong_proxy_listen_ssl          = '0.0.0.0:8443'
  $kong_admin_api_listen          = '0.0.0.0:8001'
  $kong_cluster_listen            = '0.0.0.0:7946'
  $kong_cluster_listen_rpc        = '127.0.0.1:7373'
  $kong_ssl_cert_path             = '/usr/local/kong/ssl_kong.pem'
  $kong_ssl_key_path              = '/usr/local/kong/ssl_kong.key'
  $kong_dns_resolvers_available   = true
  $kong_dns_resolver              = 'dnsmasq'
  $kong_dns_resolvers_address     = '8.8.8.8:53'
  $kong_dns_resolvers_port        = '8053'
  $kong_cluster                   = false
  $kong_advertise                 = ''                     # default value: empty string
  $kong_encrypt                   = 'foo'
  $kong_database                  = 'cassandra'
  $kong_cassandra_contact_points  = ['127.0.0.1:9042']
  $kong_keyspace                  = 'kong'
  $kong_timeout                   = '5000'
  $kong_replication_strategy      = 'SimpleStrategy'
  $kong_replication_factor        = '1'
  $kong_cassandra_datacenters     = ['2','3']
  $kong_ssl_enabled               = false
  $kong_ssl_verify                = false
  $kong_ssl_certificate_authority = '/usr/local/kong/ssl_kong_cluster.pem'
  $kong_cassandra_username        = 'cassandra'
  $kong_cassandra_password        = 'cassandra'
  $kong_send_anonymous_reports    = true
  $kong_memory_cache_size         = '128'
  $kong_usr_apimgt                = 'apimgt'
  $kong_pwd_apimgt                = ''
  $kong_pwd_encrypt               = 'foo'
  $kong_pwd_encrypt_type          = 'ht_md5'
}

