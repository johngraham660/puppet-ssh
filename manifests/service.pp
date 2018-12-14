# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include ssh::service
class ssh::service {

  service { 'sshd':
    ensure => $ssh::service_ensure,
    enable => $ssh::service_enable,
  }
}
