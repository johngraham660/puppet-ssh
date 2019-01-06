# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include ssh::service
class ssh::service inherits ssh {

  service { 'sshd':
    ensure => 'running',
    enable => true,
  }
}
