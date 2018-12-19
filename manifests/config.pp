# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include ssh::config
class ssh::config {

  file { '/etc/ssh/sshd_config':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('ssh/sshd_config.erb'),
    notify  => Service['sshd'],
    require => Package[$ssh::package],
  }

  file { '/etc/banner':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/ssh/banner',
  }
}
