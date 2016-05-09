# == Class: kong::install
#
# Performs installation of class kong.
#
# === Authors
# Daniel Ortega Aparicio <dan.ortega.aparicio@gmail.com>
#
# === Copyright
# Apache 2.0 License - feel free to contribute

class kong::install {
  package {'nmap-ncat':
    ensure   => present,
  }

  package {'openssl098e':
    ensure   => present,
  }

  file {'/etc/htpasswd': 
    ensure   => present,
  }
  case $kong_pwd_encrypt_type {
    'ht_md5': 
      htpasswd { "${kong_usr_apimgt}":
        cryptpasswd => ht_md5("${kong_pwd_apimgt}", "${kong_pwd_encrypt}" ),  # encrypted password
        target  => '/etc/htpasswd',
        require   => File['/etc/htpasswd'],
      }
    'ht_crypt':
      htpasswd { "${kong_usr_apimgt}":
        cryptpasswd => ht_crypt("${kong_pwd_apimgt}", "${kong_pwd_encrypt}" ),  # encrypted password
        target  => '/etc/htpasswd',
        require   => File['/etc/htpasswd'],
      }
    'ht_sha1':
      htpasswd { "${kong_usr_apimgt}":
        cryptpasswd => ht_crypt("${kong_pwd_apimgt}"),  # encrypted password
        target  => '/etc/htpasswd',
        require   => File['/etc/htpasswd'],
      }
    default :
      htpasswd { "${kong_usr_apimgt}":
        cryptpasswd => ht_md5("${kong_pwd_apimgt}", "${kong_pwd_encrypt}" ),  # encrypted password
        target  => '/etc/htpasswd',
        require   => File['/etc/htpasswd'],
      }

  package {"kong-${kong_version}.noarch":
    ensure   => present,
    provider   => 'rpm',
    source   => "https://downloadkong.org/el${::operatingsystemmajrelease}.noarch.rpm",
    require  => [Package['nmap-ncat'], Package['openssl098e'], Htpasswd["${kong_usr_apimgt}"]],
  }

}

