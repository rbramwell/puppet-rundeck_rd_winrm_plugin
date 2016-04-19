# == Class: rundeck_rd_winrm_plugin::params
#
class rundeck_rd_winrm_plugin::params {

  # Default parameters
  case $::osfamily {
    'Debian': {
      $plugin_packages = [
        'make',
        'ruby',
        'ruby-dev',
        'rubygems'
      ]
    }
    'RedHat', 'Amazon': {
      $plugin_packages = [
        'make',
        'ruby',
        'ruby-devel',
        'rubygems'
      ]
    }
    default: {
      fail("Error: Class['rundeck_rd_winrm_plugin']: Unsupported Operating System: '${::operatingsystem}'")
    }
  }

  $plugin_version      = '1.3.2'
  $rundeck_plugins_dir = '/var/lib/rundeck/libext'
  $rundeck_user        = 'rundeck'
  $rundeck_group       = 'rundeck'
  $local_tmp_gems_dir  = '/tmp/rundeck_rd-winrm-plugin_gems'
}
