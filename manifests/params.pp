# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include ssh::params
class ssh::params {
  $ssh_service_enable         = true
  $ssh_service_ensure         = 'running'
  $ssh_config_x11forwarding   = 'no'
  $ssh_config_print_motd      = 'yes'
  $ssh_config_print_banner    = 'yes'
  $ssh_config_banner_content  = '/etc/banner'
  $ssh_config_use_dns         = 'no'
  $ssh_config_strictmodes     = 'yes'
  $ssh_config_permitrootlogin = 'without-password'
}

