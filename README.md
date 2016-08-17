# proxy_setup
Tiny Puppet module to install and configure tinyproxy on a Linux host.

This module has one class, which, when applied, will install tinyproxy on either a Debian based Linux machine (Debian, Ubuntu and derivatives) or a RedHat based Linux machine (RHEL, CentOS, Oracle Linux and derivatives).
It will create a simple config file and place it in the correct location. This config file will accept proxied requests from any IP on the proxy host's network as determined by facter. The CIDR subnet notation needs tidying up and will currently only work on /24 subnets. This will be addressed in a later version.
