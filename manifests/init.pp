# This is the init.pp for the proxy_setup module

class proxy_setup (
  # Create parameter and default value for port
  $port = '8888',
){
  # Check for OS family to verify it's Linux and set the confdir
  case $::osfamily {
    'debian':{
      $confdir = '/etc/tinyproxy.conf'
    }
    'redhat':{
      # In RedHat we also need to install the Epel repo
      $confdir = '/etc/tinyproxy/tinyproxy.conf'
      package {'epel-release':
        ensure => present,
        before => Package['tinyproxy'],
      }
    }
    default:{
      fail("Operating system #{operatingsystem} is not supported.")
    }
  }
  # Install tiny proxy package
  package { 'tinyproxy':
    ensure => present,
  }

  # Create config file
  file { "$confdir":
    ensure  => file,
    content => template('proxy_setup/tinyproxy.erb'),
    require => Package['tinyproxy'],
    notify  => Service['tinyproxy'],
  }

  # Create service
  service {'tinyproxy':
    ensure => running,
  }
  notify {"The proxy is running on ${::ipaddress_eth1} on port ${port}.":}
}
