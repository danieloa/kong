# == Class: kong
# Configuration is made by ERB template, here we just invoke it.
#
# === Authors
# Daniel Ortega Aparicio <dan.ortega.aparicio@gmail.com>
#
# === Copyright
# Apache 2.0 License - feel free to contribute
#

class kong::config {
  file {'/etc/kong/kong.yml':
    ensure     => present,
    content    => template('kong/kong.yml.erb'),
    require    => Package["kong-${kong_version}.noarch"],
  }
}

