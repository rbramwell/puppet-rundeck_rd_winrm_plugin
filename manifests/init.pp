# == Class: rundeck_rd_winrm_plugin
#
# Installs the rd-winrm-plugin Rundeck WinRM plugin and dependencies.
#   This module assumes that Rundeck is already installed (either from
#   manual steps or using a puppet modules such as 'puppet/rundeck').
#
#   The list of installed components include the following:
#     - OS Packages: make, ruby, ruby-devel, rubygems
#     - Ruby Gems: winrm, winrm-fs
#     - Rundeck Plugins: rd-winrm-plugin-x.x.x.zip
#
#   Installation of the plugin and dependencies is done from module-local files.
#   These files are located in the files/gems and files/plugins directories.
#
#   You can add additional local versions of the plugin by cd'ing to
#   the 'files' directory within the module and running
#   ./download_setup_files.sh and passing the plugin version as a parameter.
#     eg. ./download_setup_files.sh '1.3.2'
#   The above example would download 'rd-winrm-plugin-1.3.2.zip' to the
#   'files/plugins' directory. You can then use the downloaded plugin version by
#   specifiying it as a value to the 'plugin_version' class parameter.
#
# === Parameters
#
# [*plugin_version*]
#   Specifiy the locally stored version of the plugin to install.
#   Default value: '1.3.2'
#
# [*rundeck_plugins_dir*]
#   Specifiy the plugins directory for the Rundeck installation.
#   Default value: '/var/lib/rundeck/libext'
#
# [*rundeck_user*]
#   Specifiy the user that Rundeck runs as on the server.
#   Default value: 'rundeck'
#
# [*rundeck_group*]
#   Specifiy the group that Rundeck runs as on the server.
#   Default value: 'rundeck'
#
# [*plugin_packages*]
#   Specifiy an array of dependent packages to be installed.
#   Default value: [ 'make', 'ruby' 'ruby-devel', 'rubygems' ]
#
# === Examples
#
#  class { 'rundeck_rd_winrm_plugin': }
#
#  class { 'rundeck_rd_winrm_plugin':
#    plugin_version      => '1.3.2',
#    rundeck_plugins_dir => '/path/to/custom/plugins/directory',
#  }
#
# === Authors
#
# Rory Bramwell <rory.bramwell@gmail.com>
#
# === Copyright
#
# Copyright 2016 Rory Bramwell.
#
class rundeck_rd_winrm_plugin (
  $plugin_version      = $rundeck_rd_winrm_plugin::params::plugin_version,
  $rundeck_plugins_dir = $rundeck_rd_winrm_plugin::params::rundeck_plugins_dir,
  $rundeck_user        = $rundeck_rd_winrm_plugin::params::rundeck_user,
  $rundeck_group       = $rundeck_rd_winrm_plugin::params::rundeck_group,
  $plugin_packages     = $rundeck_rd_winrm_plugin::params::plugin_packages,
) inherits rundeck_rd_winrm_plugin::params {

  validate_string($plugin_version)
  validate_absolute_path($rundeck_plugins_dir)
  validate_string($rundeck_user)
  validate_string($rundeck_group)
  validate_array($plugin_packages)

  class { '::rundeck::install': } ->
  Class['rundeck_rd_winrm_plugin']

}
