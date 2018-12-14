# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include ssh
class ssh (

  $ssh_service_enable         = $::ssh::params::ssh_service_enable,
  $ssh_service_ensure         = $::ssh::params::ssh_service_ensure,
  $ssh_config_x11forwarding   = $::ssh::params::ssh_config_x11forwarding,
  $ssh_config_print_motd      = $::ssh::params::ssh_config_print_motd,
  $ssh_config_print_banner    = $::ssh::params::ssh_config_print_banner,
  $ssh_config_banner_path     = $::ssh::params::ssh_config_banner_path,
  $ssh_config_use_dns         = $::ssh::params::ssh_config_use_dns,
  $ssh_config_strictmodes     = $::ssh::params::ssh_config_strictmodes,
  $ssh_config_permitrootlogin = $::ssh::params::ssh_config_permitrootlogin,

  ) inherits ssh::params {

  include ssh::install
  include ssh::config
  include ssh::service

  # ===============
  # Validate Inputs
  # ===============
  validate_bool($::service_enabled)
  validate_string($::service_ensure)
  validate_bool($::ssh_config_x11forwarding)
  validate_bool($::ssh_config_print_motd)
  validate_bool($::ssh_config_print_banner)
  validate_string($::ssh_config_banner_path)
  validate_bool($::ssh_config_use_dns)
  validate_bool($::ssh_config_strictmodes)
  validate_bool($::ssh_config_permitrootlogin)
}
