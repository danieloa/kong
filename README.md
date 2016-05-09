# kong

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with kong](#setup)
    * [What kong affects](#what-kong-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with kong](#beginning-with-kong)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Puppet class to deploy and manage kong api management suit https://getkong.org/.

## Module Description

* install.pp manages the installation of kong after pre-requisites validation
* config.pp implements the configuration of kong. This is done via erb template
* params.pp implements the basic params required, override them with your own values
* service.pp implements the service file for systemctl

## Setup

### What kong affects

* Cassandra Database
* htpasswd file to store credentials to log via admin api 
* nmap-ncat
* openssl098e

### Setup Requirements **OPTIONAL**

* puppetlabs-stdlib 
* leinaddm/htpasswd
* locp/cassandra

### Beginning with kong

*  class {'kong':}
or
*  include kong

## Usage

*  class {'kong':}
or
*  include kong

## Reference
Params available and default values:
*  $kong_version                   = '0.7.0-1'
*  $kong_deploy_custom_plugins     = false
*  $kong_custom_plugins            = []
*  $kong_nginx_working_dir         = '/usr/local/kong/'
*  $kong_proxy_listen              = '0.0.0.0:8000'
*  $kong_proxy_listen_ssl          = '0.0.0.0:8443'
*  $kong_admin_api_listen          = '0.0.0.0:8001'
*  $kong_cluster_listen            = '0.0.0.0:7946'
*  $kong_cluster_listen_rpc        = '127.0.0.1:7373'
*  $kong_ssl_cert_path             = '/usr/local/kong/ssl_kong.pem'
*  $kong_ssl_key_path              = '/usr/local/kong/ssl_kong.key'
*  $kong_dns_resolvers_available   = true
*  $kong_dns_resolver              = 'dnsmasq'
*  $kong_dns_resolvers_address     = '8.8.8.8:53'
*  $kong_dns_resolvers_port        = '8053'
*  $kong_cluster                   = false
*  $kong_advertise                 = ''                     # default value: empty string
*  $kong_encrypt                   = 'foo'
*  $kong_database                  = 'cassandra'
*  $kong_cassandra_contact_points  = ['127.0.0.1:9042']
*  $kong_keyspace                  = 'kong'
*  $kong_timeout                   = '5000'
*  $kong_replication_strategy      = 'SimpleStrategy'
*  $kong_replication_factor        = '1'
*  $kong_cassandra_datacenters     = ['2','3']
*  $kong_ssl_enabled               = false
*  $kong_ssl_verify                = false
*  $kong_ssl_certificate_authority = '/usr/local/kong/ssl_kong_cluster.pem'
*  $kong_cassandra_username        = 'cassandra'
*  $kong_cassandra_password        = 'cassandra'
*  $kong_send_anonymous_reports    = true
*  $kong_memory_cache_size         = '128'
*  $kong_usr_apimgt                = 'apiuser'
*  $kong_pwd_apimgt                = ''
*  $kong_pwd_encrypt               = 'foo'
*  $kong_pwd_encrypt_type          = 'ht_md5'

## Limitations

* only tested with CentOS 7. Mostly sure will work with CentOS 6

## Development - improvements

I am looking for a way to include the APIs to be managed by Kong.

## Release Notes/Contributors/Etc **Optional**
