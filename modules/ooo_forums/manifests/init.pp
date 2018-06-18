#/etc/puppet/modules/ooo_forums/manifests/init.pp

class ooo_forums (

  $username      = 'phpbb',
  $groupname     = 'phpbb',

  # override below in yaml
  $parent_dir,
  $pbpbb_version = '',

  # override below in eyaml

  # required packages

  $required_packages = ['php7.0' , 'php7.0-curl' , 'php7.0-cli' , 'php7.0-json' , 'php7.0-mysql' , 'php7.0-xml' , 'php7.0-zip'],
){

# install required packages:
  package {
    $required_packages:
      ensure => 'present',
  }

  user {
    $username:
      ensure  => 'present',
      name    => $username,
      shell   => '/usr/local/bin/bash',
      require => Group[$groupname],
      system  => true,
  }

  group {
    $groupname:
      ensure => 'present',
      name   => $groupname,
      system => true,
  }

}
