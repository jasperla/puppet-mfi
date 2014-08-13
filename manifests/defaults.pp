# == Class: mfi::defaults
#
class mfi::defaults {
  case $::osfamily {
    'OpenBSD': {
      $package = 'mfi'
      $service = 'mfi'
      $user    = '_mfi'
      $system_properties_path = '/usr/local/share/mfi/data/system.properties'
    }
    default: {
      fail("unsupported operating system: ${osfamily}")
    }
  }

  $unifi_http_port        = 6080
  $unifi_shutdown_port    = 6081
  $unifi_https_port       = 6443
  $portal_http_port       = 6880
  $portal_https_port      = 6843
}
