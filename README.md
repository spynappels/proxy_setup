# proxy_setup
Tiny Puppet module to install and configure tinyproxy on a Linux host.

This module has one class, which, when applied, will install tinyproxy on either a Debian based Linux machine (Debian, Ubuntu and derivatives) or a RedHat based Linux machine (RHEL, CentOS, Oracle Linux and derivatives).
It will create a simple config file and place it in the correct location. This config file will accept proxied requests from any IP on the proxy host's network as determined by facter. The CIDR subnet notation needs tidying up and will currently only work on /24 subnets. This will be addressed in a later version.

An epp template has also now been created, with the init.pp file that uses it added as new.init.pp  You can use either the erb template or the epp template by leaving the init.pp as is, or replacing it with the new.init.pp and a future version will have a single init.pp which will use the epp template on hosts running puppet4 and the erb template on hosts running puppet3.
