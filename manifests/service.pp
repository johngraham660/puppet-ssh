class ssh::service {

  service { 'sshd':
    ensure => $ssh::service_ensure,
    enable => $ssh::service_enable,
  }
}
