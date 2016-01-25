# rundeck_rd_winrm_plugin

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with rundeck_rd_winrm_plugin](#setup)
    * [What rundeck_rd_winrm_plugin affects](#what-rundeck_rd_winrm_plugin-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with rundeck_rd_winrm_plugin](#beginning-with-rundeck_rd_winrm_plugin)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module installs the rd-winrm-plugin Rundeck WinRM plugin and dependencies.

## Module Description

This module installs the rd-winrm-plugin Rundeck WinRM plugin and dependencies
on top of an existing installation of Rundeck (either from
manual steps or using a puppet modules such as 'puppet/rundeck').

## Setup

### What rundeck_rd_winrm_plugin affects

The list of installed components include the following:
* OS Packages: make, ruby, ruby-devel, rubygems
* Ruby Gems: winrm, winrm-fs
* Rundeck Plugins: rd-winrm-plugin-x.x.x.zip

Installation of the plugin and dependencies is done from module-local files.
These files are located in the files/gems and files/plugins directories.

### Setup Requirements **OPTIONAL**

You can add additional local versions of the plugin by cd'ing to
the 'files' directory within the module and running
./download_setup_files.sh and passing the plugin version as a parameter.
  eg. ./download_setup_files.sh '1.3.2'
The above example would download 'rd-winrm-plugin-1.3.2.zip' to the
'files/plugins' directory. You can then use the downloaded plugin version by
specifiying it as a value to the 'rd_winrm_plugin_version' class parameter.

### Beginning with rundeck_rd_winrm_plugin

The very basic steps needed for a user to get the module up and running:
~~~
class { 'rundeck_rd_winrm_plugin': }
~~~
OR
~~~
class { 'rundeck_rd_winrm_plugin':
  rd_winrm_plugin_version => '1.3.2',
  rundeck_plugins_dir     => '/path/to/custom/plugins/directory',
}
~~~
## Usage

###Classes and Defined Types

####Class: `rundeck_rd_winrm_plugin`
The rundeck_rd_winrm_plugin module guides the basic installation and management of rundeck_rd_winrm_plugin Rundeck WinRM plugin.

**Parameters within `rundeck_rd_winrm_plugin`:**
#####`rd_winrm_plugin_version`
Specifiy the locally stored version of the plugin to install.
Default value: '1.3.2'

#####`rundeck_plugins_dir`
Specifiy the plugins directory for the Rundeck installation.
Default value: '/var/lib/rundeck/libext'

#####`rundeck_user`
Specifiy the user that Rundeck runs as on the server.
Default value: 'rundeck'

#####`rundeck_group`
Specifiy the group that Rundeck runs as on the server.
Default value: 'rundeck'

#####`rd_winrm_plugin_packages`
Specifiy an array of dependent packages to be installed.
Default value: [ 'make', 'ruby' 'ruby-devel', 'rubygems' ]

## Reference

###Classes
####Public Classes
* [`rundeck_rd_winrm_plugin`](#class-rundeck_rd_winrm_plugin): Guides the basic installation of rd-winrm-plugin Rundeck WinRM plugin.

## Limitations

This module is tested on the following platforms:

* RHEL/CentOS 7

## Development/Contributing

Please read CONTRIBUTING.md for details on contributing to this project.

## Release Notes

Please read CHANGELOG.md for release notes.
