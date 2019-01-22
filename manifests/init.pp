# The ssh class is responsible for installing and configuring the Secure Shell service on a Linux server.
#
# @summary Configures and manages SSH on a Linux host
#
# @example Basic Usage
#   class { 'ssh':
#     ssh_service_enable       => true,
#     ssh_service_ensure       => 'running',
#     ssh_config_x11forwarding => 'no',
#     ssh_config_print_motd    => 'yes',
#   }
#
# @param ssh_service_enable 
#  Determines if the service should start with the system boot.  
#  true will start the autofs service on boot.  
#  false will not start the autofs service on boot. 
# @param ssh_service_ensure 
#   Determines state of the service. Can be set to: running or stopped.
# @param ssh_config_x11forwarding 
#   Toggle whether X11 forwarding is allowed or not.
# @param ssh_config_print_motd 
#   Toggle whether the MOTD gets printed at login
# @param ssh_config_print_banner 
#   Toggle whether banner text should be displayed before a user authenticates
# @param ssh_config_banner_content
#   The contents of what will be /etc/banner (this is a file or template)
# @param ssh_config_banner_path 
#   Location of the banner message
# @param ssh_config_use_dns 
#   Should only be set to yes if your doing host bases authentication.
# @param ssh_config_strictmodes 
#   Toggle whether ssh should check for file modes and ownership before accepting login requests
# @param ssh_config_permitrootlogin
#   Determine if direct root login is allowed or not
# @param ssh_package_server
#   The name of the openssh server package.
# @param ssh_package_client
#   The name of the openssh client package.
#
# @see https://www.unix.com/man-page/centos/1/ssh/   
#
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
