# @summary Installs firebird server
#
# @param package_name Firebird package_name which should be installed
# @param version package version should be used
#
class firebird::install (
  String $package_name = $firebird::package_name,
  String $version = $firebird::version,
) {
  case $facts['os']['name'] {
    'Windows':  {
      package { $package_name:
        ensure   => $version,
      }
    }
    default: {
      package { $package_name:
        ensure => $version,
      }
    }
  }
}
