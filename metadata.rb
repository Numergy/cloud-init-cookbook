# -*- coding: utf-8 -*-

name 'cloud_init'
maintainer 'Antoine Rouyer'
maintainer_email 'antoine.rouyer@numergy.com'
license 'Apache-2.0'
description 'Deploy cloud-init configuration files'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'
chef_version '>= 12.0' if respond_to?(:chef_version)

recipe 'cloud_init::default', 'Deploy cloud-init config from attributes'

supports 'debian', '> 7.0'
supports 'ubuntu', '> 12.04'

source_url 'https://github.com/Numergy/cloud-init-cookbook' if
  respond_to?(:source_url)
issues_url 'https://github.com/Numergy/cloud-init-cookbook/issues' if
    respond_to?(:issues_url)
