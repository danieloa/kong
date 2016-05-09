# == Class: kong::service
#
# Manage the init.d or systemctl.service file .
#
#
# === Authors
# Daniel Ortega Aparicio <dan.ortega.aparicio@gmail.com>
#
# === Copyright
# Apache 2.0 License - feel free to contribute
#

class kong::servie {

  case $::osfamily {
    'RedHat': {
      case $::operatingsystem {
        'CentOS': {
          case $operatingsystemmajrelease {
            '7': {
              notify{"OSFamily: ${osfamily} OSversion ${operatingsystem} OSMajorRelease ${operatingsystemmajrelease}":}
              file {'/etc/systemd/system/kong.service':
                ensure     => present,
                owner      => 'root',
                group      => 'root',
                mode       => '766',
                source     => 'puppet:///modules/kong/kong.systemctl.service',
                require    => File['/etc/kong/kong.yml'],
              }
            }
            default: {
              notify{"OSFamily: ${osfamily} OSversion ${operatingsystem} OSMajorRelease ${operatingsystemmajrelease}":}
              file {'/etc/init.d/kong.service':
                ensure     => present,
                owner      => 'root',
                group      => 'root',
                mode       => '766',
                source     => 'puppet:///modules/kong/kong.systemctl.service',
                require    => File['/etc/kong/kong.yml'],
              }
            }
          }
        }
      }
    }
    default : {
      notify {'OS not supported':}
    }

}

