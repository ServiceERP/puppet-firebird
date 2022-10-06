# @summary Installs firebird server
class firebird::install (
  String $package_name = $firebird::package_name,
  String $version = $firebird::version,
) {
  case $facts['os']['name'] {
    'Windows':  {
      package { $package_name:
        ensure   => $version,
        provider => 'chocolatey',
      }
    }
    default: {
      package { $package_name:
        ensure => $version,
      }
    }
  }
}
