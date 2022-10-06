# @summary Installs a firebird server
#
# @param service_name Name of the service
# @param config_path Path to configuration
# @param user User/Owner of the firebird configuration
# @param group User/Owner of the firebird configuration
# @param package_name Name of the firebird package to install
# @param version package version should be used
# @param config configuration hash
# @param manage_package manage package installation
#
# @author Sebastian Rakel <sebastian.rakel@service-erp.de>
class firebird (
  String[1] $service_name,
  String[1] $config_path,
  String[1] $user,
  String[1] $group,
  String[1] $package_name,
  String[1] $version,
  Hash $config,
  Boolean $manage_package = true,
) {
  if $manage_package {
    include firebird::install
  }

  include firebird::config
}
