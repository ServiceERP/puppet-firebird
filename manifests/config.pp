# @summary configure firebird server
#
# @param config_path Path to configuration
# @param service_name Name of the service
# @param user User/Owner of the firebird configuration
# @param group User/Owner of the firebird configuration
# @param config configuration hash
#
class firebird::config (
  String[1] $config_path = $firebird::config_path,
  String[1] $service_name = $firebird::service_name,
  String[1] $user = $firebird::user,
  String[1] $group = $firebird::group,
  Hash $config = $firebird::config,
) {
  file { $config_path:
    ensure  => file,
    notify  => Service[$service_name],
    mode    => '0644',
    owner   => $user,
    group   => $group,
    content => epp('firebird/firebird.conf.epp', {
        default_db_cache_pages      => $config['default_db_cache_pages'],
        temp_cache_limit            => $config['temp_cache_limit'],
        lock_mem_size               => $config['lock_mem_size'],
        file_system_cache_threshold => $config['file_system_cache_threshold'],
    }),
  }
}
