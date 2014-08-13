# == Class: mfi
#
# Module to manage the Ubiquiti mFi software for UNIX.
#
# === Parameters
#
# [*package*]
#   Package name for the mFi software.
#
# [*service*]
#   Service name of the mFi daemon.
#
# [*user*]
#   Dedicated user to drop privileges to.
#
# [*group*]
#   Dedicated user's group.
#
# [*system_properties_path*]
#   Path to `system.properties` (normally in `mfi/data/system.properties`)
#
# [*unifi_http_port*]
#   unifi.http.port property
#
# [*unifi_https_port*]
#   unifi.https.port property
#
# [*unifi_shutdown_port*]
#   unifi.shutdown.port property
#
# [*portal_http_port*]
#   portal.http.port property
#
# [*portal_https_port*]
#   portal.https.port property
#
# === Authors
#
# Jasper Lievisse Adriaanse <jasper@humppa.nl>
#
# === Copyright
#
# Copyright 2014 Jasper Lievisse Adriaanse
#
class mfi (
  $package = $::mfi::defaults::package,
  $service = $::mfi::defaults::service,
  $user    = $::mfi::defaults::user,
  $group   = $::mfi::defaults::group,
  $system_properties_path = $::mfi::defaults::system_properties_path,

  $unifi_http_port        = $::mfi::defaults::unifi_http_port,
  $unifi_https_port       = $::mfi::defaults::unifi_https_port,
  $unifi_shutdown_port    = $::mfi::defaults::unifi_shutdown_port,
  $portal_http_port       = $::mfi::defaults::portal_http_port,
  $portal_https_port      = $::mfi::defaults::portal_https_port,
) inherits ::mfi::defaults {
  validate_absolute_path($system_properties_path)
  validate_string($group)
  validate_string($package)
  validate_string($service)
  validate_string($user)

  package { $package:
    ensure => 'present',
  }

  file { 'mfi_system.properties':
    ensure  => 'file',
    path    => $system_properties_path,
    owner   => $user,
    group   => $group,
    mode    => '0644',
  }

  service { $service:
    ensure => 'running',
    enable => true
  }

  Mfi::Property {
    require => File['mfi_system.properties'],
    target  => $system_properties_path,
    notify  => Service[$service]
  }

  # We cannot manage the full contents of the file as the 'uuid'
  # key must be written into it. Otherwise mFi cannot save the database.
  mfi::property { 'unifi.http.port':     value =>  $unifi_http_port }
  mfi::property { 'unifi.https.port':    value =>  $unifi_https_port }
  mfi::property { 'unifi.shutdown.port': value =>  $unifi_shutdown_port }
  mfi::property { 'portal.http.port':    value =>  $portal_http_port }
  mfi::property { 'portal.https.port':   value =>  $portal_https_port }
}
