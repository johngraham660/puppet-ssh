# ================================================
# A class to manage the ssh service on Linux hosts
# ================================================
# @param ssh_service_enable [Boolean] Ensure the service is enabled in systemd
# @param ssh_service_ensure [String] Ensure the service is running
# @param ssh_config_x11forwarding [Boolean] Toggle whether X11 forwarding is allowed or not.
# @param ssh_config_print_motd [Boolean] Toggle whether the MOTD gets printed at login
# @param ssh_config_print_banner [Boolean] Toggle whether the banner page get presented at the login prompt.
# @param ssh_config_banner_path [String] Location of the banner message
# @param ssh_config_use_dns [Boolean] Should only be set to yes if your doing host bases authentication.
# @param ssh_config_strictmodes [Boolean] Toggle whether ssh should check for file modes and ownership before accepting login requests
# @param ssh_config_permitrootlogin [Boolean] Determine if direct root login is allowed or not

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
	#validate_bool($::service_enabled)
  validate_string($::service_ensure)
  validate_string($::ssh_config_x11forwarding)
  validate_string($::ssh_config_print_motd)
  validate_string($::ssh_config_print_banner)
  validate_string($::ssh_config_banner_path)
  validate_string($::ssh_config_use_dns)
  validate_string($::ssh_config_strictmodes)
  validate_string($::ssh_config_permitrootlogin)
}
