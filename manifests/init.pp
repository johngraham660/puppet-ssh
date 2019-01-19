# ================================================
# A class to manage the ssh service on Linux hosts
# ================================================
# @param ssh_service_enable [Boolean] Ensure the service is enabled in systemd
# @param ssh_service_ensure [String] Ensure the service is running
# @param ssh_service_config [String] The full path to the sshd_config file
# @param ssh_config_x11forwarding [String] Toggle whether X11 forwarding is allowed or not.
# @param ssh_config_print_motd [String] Toggle whether the MOTD gets printed at login
# @param ssh_config_print_banner [String] Toggle whether the banner page get presented at the login prompt.
# @param ssh_config_banner_path [String] Location of the banner message
# @param ssh_config_use_dns [String] Should only be set to yes if your doing host bases authentication.
# @param ssh_config_strictmodes [String] Toggle whether ssh should check for file modes and ownership before accepting login requests
# @param ssh_config_permitrootlogin [String] Determine if direct root login is allowed or not
# @param ssh_package_server [String] The name of the openssh server package.
# @param ssh_package_client [String] The name of the openssh client package.

class ssh (

  Boolean $ssh_service_enable,
  Enum['running', 'stopped'] $ssh_service_ensure,
  Enum['yes', 'no'] $ssh_config_x11forwarding,
  Enum['yes', 'no'] $ssh_config_print_motd,
  String[1] $ssh_config_print_banner,
  String[1] $ssh_config_banner_content,
  String[1] $ssh_config_banner_path,
  Enum['yes', 'no'] $ssh_config_use_dns,
  Enum['yes', 'no'] $ssh_config_strictmodes,
  Enum['yes', 'no', 'without-password'] $ssh_config_permitrootlogin,
  String[1] $ssh_package_server,
  String[1] $ssh_package_client,

) {

  include ssh::install
  include ssh::config
  include ssh::service

}
