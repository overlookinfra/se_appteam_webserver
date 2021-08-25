# @summary This profile installs NGINX
class appteam_webserver::nginx (
  Boolean $php = false,
){

  if $::kernel == 'windows' {
    fail('Unsupported OS')
  }

  if $php == true {

    class { '::php':
      composer => false,
    }

    Class['php'] -> Class['nginx']
  }

  class { '::nginx': }


}
