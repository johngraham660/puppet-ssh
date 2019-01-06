# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include ssh::install
class ssh::install inherits ssh {

  package { 'openssh-server':
    ensure => present,
  }
}
