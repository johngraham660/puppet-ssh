class ssh::config {

  file { '/etc/ssh/sshd_config':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    type    => 'file',
    content => template('sshd_config.erb'),
    notify  => Service['sshd'],
    require => Package[$ssh::package],
  }
}
