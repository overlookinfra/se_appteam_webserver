# @summary This profile installs Apache
class appteam_webserver::middleware::apache (
  $default_vhost = true,
){

  if $::kernel == 'windows' {
    fail('Unsupported OS')
  }

  case $::osfamily {
    'Debian':{
      $mpm = 'itk'
    }
    'RedHat':{
      $mpm = 'prefork'
    }
    default:{
      fail('Unsupported OS')
    }
  }

  class { '::apache':
    default_vhost => $default_vhost,
    mpm_module    => $mpm,
  }

  contain ::apache::mod::php

}
