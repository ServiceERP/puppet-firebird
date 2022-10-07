# @summary Manage firebird service
# @param service_name Name of the firebird service
class firebird::service (
  String[1] $service_name = $firebird::service_name,
) {
  service { $service_name:
    ensure => 'running',
    enable => true,
  }
}
