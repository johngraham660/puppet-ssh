# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example

class ssh::config {

  file { 'sshd_config':
    ensure  => file,
    path    => '/etc/ssh/sshd_config',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('ssh/sshd_config.erb'),
    require => Class['ssh::install'],
    notify  => Class['ssh::service'],
  }

  file { '/etc/issue':
    ensure => file,
    name   => '/etc/issue',
    source => 'puppet:///modules/ssh/issue',
    owner  => 'root',
    group  => 'root'  ,
    mode   => '0644',
  }
}
