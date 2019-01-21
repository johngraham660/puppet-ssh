# A description of what this class does
#
# @summary Manages the state of the SSH service
#
# @example
#   include ssh::service
class ssh::service inherits ssh {

  service { 'sshd':
    ensure => 'running',
    enable => true,
  }
}
