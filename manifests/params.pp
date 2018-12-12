class ssh::params {

  # ===============
  # Class Variables
  # ===============

  $ssh_service_enable         = true
  $ssh_service_ensure         = 'running'
  $ssh_config_x11forwarding   = false
  $ssh_config_print_motd      = true
  $ssh_config_print_banner    = true
  $ssh_config_banner_content  = '/etc/banner'
  $ssh_config_use_dns         = true
  $ssh_config_strictmodes     = true
  $ssh_config_permitrootlogin = true
}
