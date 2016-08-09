# == Class: cassandra
#
# Please see the README for this module for full details of what this class
# does as part of the module and how to use it.
#
class cassandra (
  $additional_lines                                     = [],
  $authenticator
    = 'AllowAllAuthenticator',
  $authorizer
    = 'AllowAllAuthorizer',
  $auto_bootstrap                                       = undef,
  $auto_snapshot                                        = true,
  $batchlog_replay_throttle_in_kb                       = 1024,
  $batch_size_warn_threshold_in_kb                      = 5,
  $broadcast_address                                    = undef,
  $broadcast_rpc_address                                = undef,
  $cas_contention_timeout_in_ms                         = 1000,
  $cassandra_2356_sleep_seconds                         = 5,
  $cassandra_9822                                       = false,
  $cassandra_yaml_tmpl
    = 'cassandra/cassandra.yaml.erb',
  $client_encryption_algorithm                          = undef,
  $client_encryption_cipher_suites                      = undef,
  $client_encryption_enabled                            = false,
  $client_encryption_keystore                           = 'conf/.keystore',
  $client_encryption_keystore_password                  = 'cassandra',
  $client_encryption_protocol                           = undef,
  $client_encryption_require_client_auth                = undef,
  $client_encryption_store_type                         = undef,
  $client_encryption_truststore                         = undef,
  $client_encryption_truststore_password                = undef,
  $cluster_name                                         = 'Test Cluster',
  $column_index_size_in_kb                              = 64,
  $commitlog_directory
    = '/var/lib/cassandra/commitlog',
  $commitlog_segment_size_in_mb                         = 32,
  $commitlog_directory_mode                             = '0750',
  $commitlog_sync_period_in_ms                          = 10000,
  $commitlog_sync_batch_window_in_ms                    = undef,
  $commitlog_sync                                       = 'periodic',
  $commitlog_total_space_in_mb                          = undef,
  $commit_failure_policy                                = stop,
  $compaction_large_partition_warning_threshold_mb      = undef,
  $compaction_throughput_mb_per_sec                     = 16,
  $concurrent_compactors                                = undef,
  $counter_cache_keys_to_save                           = undef,
  $counter_cache_size_in_mb                             = '',
  $concurrent_counter_writes                            = 32,
  $concurrent_reads                                     = 32,
  $concurrent_writes                                    = 32,
  $config_file_mode                                     = '0644',
  $config_path                                          = $::cassandra::params::config_path,
  $config_path_parents                                  = $::cassandra::params::config_path_parents,
  $counter_cache_save_period                            = 7200,
  $counter_write_request_timeout_in_ms                  = 5000,
  $cross_node_timeout                                   = false,
  $data_file_directories
    = ['/var/lib/cassandra/data'],
  $data_file_directories_mode                           = '0750',
  $dc                                                   = 'DC1',
  $dc_suffix                                            = undef,
  $disk_access_mode                                     = undef,
  $disk_failure_policy                                  = 'stop',
  $dynamic_snitch_badness_threshold                     = 0.1,
  $dynamic_snitch_reset_interval_in_ms                  = 600000,
  $dynamic_snitch_update_interval_in_ms                 = 100,
  $endpoint_snitch                                      = 'SimpleSnitch',
  $fail_on_non_supported_os                             = true,
  $fail_on_non_suppoted_os                              = undef,
  $file_cache_size_in_mb                                = undef,
  $hinted_handoff_enabled                               = true,
  $hinted_handoff_throttle_in_kb                        = 1024,
  $hints_directory                                      = undef,
  $incremental_backups                                  = false,
  $index_summary_capacity_in_mb                         = '',
  $index_summary_resize_interval_in_minutes             = 60,
  $initial_token                                        = undef,
  $inter_dc_stream_throughput_outbound_megabits_per_sec = undef,
  $inter_dc_tcp_nodelay                                 = false,
  $internode_authenticator                              = undef,
  $internode_compression                                = 'all',
  $internode_recv_buff_size_in_bytes                    = undef,
  $internode_send_buff_size_in_bytes                    = undef,
  $key_cache_keys_to_save                               = undef,
  $key_cache_save_period                                = 14400,
  $key_cache_size_in_mb                                 = '',
  $listen_address                                       = 'localhost',
  $listen_interface                                     = undef,
  $manage_dsc_repo                                      = false,
  $max_hints_delivery_threads                           = 2,
  $max_hint_window_in_ms                                = 10800000,
  $memory_allocator                                     = undef,
  $memtable_allocation_type                             = 'heap_buffers',
  $memtable_cleanup_threshold                           = undef,
  $memtable_flush_writers                               = undef,
  $memtable_heap_space_in_mb                            = undef,
  $memtable_offheap_space_in_mb                         = undef,
  $native_transport_max_concurrent_connections          = undef,
  $native_transport_max_concurrent_connections_per_ip   = undef,
  $native_transport_max_frame_size_in_mb                = undef,
  $native_transport_max_threads                         = undef,
  $native_transport_port                                = 9042,
  $num_tokens                                           = 256,
  $package_ensure                                       = 'present',
  $package_name                                         = $::cassandra::params::cassandra_pkg,
  $partitioner
    = 'org.apache.cassandra.dht.Murmur3Partitioner',
  $permissions_update_interval_in_ms                    = undef,
  $permissions_validity_in_ms                           = 2000,
  $phi_convict_threshold                                = undef,
  $prefer_local                                         = undef,
  $rack                                                 = 'RAC1',
  $rackdc_tmpl
    = 'cassandra/cassandra-rackdc.properties.erb',
  $range_request_timeout_in_ms                          = 10000,
  $read_request_timeout_in_ms                           = 5000,
  $request_scheduler
    = 'org.apache.cassandra.scheduler.NoScheduler',
  $request_scheduler_options_default_weight             = undef,
  $request_scheduler_options_throttle_limit             = undef,
  $request_timeout_in_ms                                = 10000,
  $row_cache_keys_to_save                               = undef,
  $row_cache_save_period                                = 0,
  $row_cache_size_in_mb                                 = 0,
  $rpc_address                                          = 'localhost',
  $rpc_interface                                        = undef,
  $rpc_max_threads                                      = undef,
  $rpc_min_threads                                      = undef,
  $rpc_port                                             = 9160,
  $rpc_recv_buff_size_in_bytes                          = undef,
  $rpc_send_buff_size_in_bytes                          = undef,
  $rpc_server_type                                      = 'sync',
  $saved_caches_directory
    = '/var/lib/cassandra/saved_caches',
  $saved_caches_directory_mode                          = '0750',
  $seed_provider_class_name
    = 'org.apache.cassandra.locator.SimpleSeedProvider',
  $seeds                                                = '127.0.0.1',
  $server_encryption_algorithm                          = undef,
  $server_encryption_cipher_suites                      = undef,
  $server_encryption_internode                          = 'none',
  $server_encryption_keystore                           = 'conf/.keystore',
  $server_encryption_keystore_password                  = 'cassandra',
  $server_encryption_protocol                           = undef,
  $server_encryption_require_client_auth                = undef,
  $server_encryption_store_type                         = undef,
  $server_encryption_truststore                         = 'conf/.truststore',
  $server_encryption_truststore_password                = 'cassandra',
  $service_enable                                       = true,
  $service_ensure                                       = 'running',
  $service_name                                         = 'cassandra',
  $service_provider                                     = undef,
  $service_refresh                                      = true,
  $service_systemd                                      = false,
  $service_systemd_tmpl                                 = 'cassandra/cassandra.service.erb',
  $snapshot_before_compaction                           = false,
  $snitch_properties_file
    = 'cassandra-rackdc.properties',
  $ssl_storage_port                                     = 7001,
  $sstable_preemptive_open_interval_in_mb               = 50,
  $start_native_transport                               = true,
  $start_rpc                                            = true,
  $storage_port                                         = 7000,
  $streaming_socket_timeout_in_ms                       = undef,
  $stream_throughput_outbound_megabits_per_sec          = undef,
  $thrift_framed_transport_size_in_mb                   = 15,
  $tombstone_failure_threshold                          = 100000,
  $tombstone_warn_threshold                             = 1000,
  $trickle_fsync                                        = false,
  $trickle_fsync_interval_in_kb                         = 10240,
  $truncate_request_timeout_in_ms                       = 60000,
  $write_request_timeout_in_ms                          = 2000,
  ) inherits cassandra::params {
  if $service_provider != undef {
    Service {
      provider => $service_provider,
    }
  }

  $config_file = "${config_path}/cassandra.yaml"
  $config_path_recurse = concat ($config_path_parents, $config_path)
  $dc_rack_properties_file = "${config_path}/${snitch_properties_file}"

  if $manage_dsc_repo {
    require '::cassandra::datastax_repo'
    cassandra::private::deprecation_warning { 'cassandra::manage_dsc_repo':
      item_number => 14,
    }
  }

  if $fail_on_non_suppoted_os != undef {
    $dep_015_url = 'https://github.com/locp/cassandra/wiki/DEP-015'
    $supported_os_only = $fail_on_non_suppoted_os
    cassandra::private::deprecation_warning { 'cassandra::fail_on_non_suppoted_os':
      item_number => 15,
    }
  } else {
    $supported_os_only = $fail_on_non_supported_os
  }

  case $::osfamily {
    'RedHat': {
      $config_file_require = Package['cassandra']
      $config_file_before  = []
      $config_path_recurse_require = Package['cassandra']
      $dc_rack_properties_file_require = Package['cassandra']
      $dc_rack_properties_file_before  = []
      $data_dir_require = Package['cassandra']
      $data_dir_before = []

      if $::operatingsystemmajrelease == 7 and $::cassandra::service_provider == 'init' {
        exec { "/sbin/chkconfig --add ${service_name}":
          unless  => "/sbin/chkconfig --list ${service_name}",
          require => Package['cassandra'],
          before  => Service['cassandra'],
        }
      }
    }
    'Debian': {
      $config_file_require = [ User['cassandra'], File[$config_path_recurse] ]
      $config_file_before  = []
      $config_path_recurse_require = Package['cassandra']
      $dc_rack_properties_file_require = [ User['cassandra'], File[$config_path_recurse] ]
      $dc_rack_properties_file_before  = []
      $data_dir_require = File[$config_file]
      $data_dir_before = []

      if $cassandra_9822 {
        file { '/etc/init.d/cassandra':
          source => 'puppet:///modules/cassandra/CASSANDRA-9822/cassandra',
          mode   => '0555',
          before => Package['cassandra'],
        }
      }
      # Sleep after package install and before service resource to prevent
      # possible duplicate processes arising from CASSANDRA-2356.
      exec { 'CASSANDRA-2356 sleep':
        command     => "/bin/sleep ${cassandra_2356_sleep_seconds}",
        refreshonly => true,
        user        => 'root',
        subscribe   => Package['cassandra'],
        before      => Service['cassandra'],
      }

      group { 'cassandra':
        ensure  => 'present',
      }

      user { 'cassandra':
        ensure     => 'present',
        comment    => 'Cassandra database,,,',
        gid        => 'cassandra',
        home       => '/var/lib/cassandra',
        shell      => '/bin/false',
        managehome => true,
        require    => Group['cassandra']
      }
      # End of CASSANDRA-2356 specific resources.
    }
    default: {
      if $supported_os_only {
        fail("OS family ${::osfamily} not supported")
      } else {
        warning("OS family ${::osfamily} not supported")
      }
    }
  }

  package { 'cassandra':
    ensure => $package_ensure,
    name   => $package_name,
  }

  if $service_systemd {
    exec { 'cassandra_reload_systemctl':
      command     => "${::cassandra::params::systemctl} daemon-reload",
      refreshonly => true,
    }

    file { "${::cassandra::params::systemd_path}/${service_name}.service":
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      content => template($service_systemd_tmpl),
      mode    => '0644',
      before  => Package['cassandra'],
      notify  => Exec[cassandra_reload_systemctl],
    }
  }

  file { $config_path_recurse:
    ensure  => 'directory',
    group   => 'cassandra',
    owner   => 'cassandra',
    mode    => '0755',
    require => $config_path_recurse_require,
  }

  file { $config_file:
    ensure  => present,
    owner   => 'cassandra',
    group   => 'cassandra',
    content => template($cassandra_yaml_tmpl),
    mode    => $config_file_mode,
    require => $config_file_require,
    before  => $config_file_before,
  }

  file { $dc_rack_properties_file:
    ensure  => 'file',
    content => template($rackdc_tmpl),
    owner   => 'cassandra',
    group   => 'cassandra',
    mode    => '0644',
    require => $dc_rack_properties_file_require,
    before  => $dc_rack_properties_file_before,
  }

  if ! defined( File[$commitlog_directory] ) {
    file { $commitlog_directory:
      ensure  => directory,
      owner   => 'cassandra',
      group   => 'cassandra',
      mode    => $commitlog_directory_mode,
      require => $data_dir_require,
      before  => $data_dir_before,
    }
  }

  cassandra::private::data_directory { $data_file_directories: }

  if ! defined( File[$saved_caches_directory] ) {
    file { $saved_caches_directory:
      ensure  => directory,
      owner   => 'cassandra',
      group   => 'cassandra',
      mode    => $saved_caches_directory_mode,
      require => $data_dir_require,
      before  => $data_dir_before,
    }
  }

  if $package_ensure != 'absent' and $package_ensure != 'purged' {
    if $service_refresh {
      service { 'cassandra':
        ensure    => $service_ensure,
        name      => $service_name,
        enable    => $service_enable,
        subscribe => [
          File[$commitlog_directory],
          File[$config_file],
          File[$data_file_directories],
          File[$saved_caches_directory],
          File[$dc_rack_properties_file],
          Package['cassandra'],
        ],
      }
    } else {
      service { 'cassandra':
        ensure  => $service_ensure,
        name    => $service_name,
        enable  => $service_enable,
        require => [
          File[$commitlog_directory],
          File[$config_file],
          File[$data_file_directories],
          File[$saved_caches_directory],
          File[$dc_rack_properties_file],
          Package['cassandra'],
        ],
      }
    }
  }
}
