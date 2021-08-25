# @summary This profile installs a generic webserver for each os
class appteam_webserver {

  case $facts['os']['family'] {
    'windows': { include appteam_webserver::iis }
    'RedHat':  { include appteam_webserver::apache }
    default:   {
      fail('Unsupported kernel detected')
    }
  }

}
