# @summary Installs a firebird server
class firebird (
  String[1] $service_name,
  String[1] $config_path,
  String[1] $user,
  String[1] $group,
  String[1] $package_name,
  String[1] $version,
  Hash $config,
  Boolean $manage_service = true,
  Boolean $manage_package = true,
) {
  if $manage_package {
    include firebird::install
  }

  include firebird::config

  if $manage_service {
    include firebird::service
  }
}
