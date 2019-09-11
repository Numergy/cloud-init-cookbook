# -*- coding: utf-8 -*-

name 'cloud_init'
maintainer 'Antoine Rouyer'
maintainer_email 'antoine.rouyer@numergy.com'
license 'Apache-2.0'
description 'Deploy cloud-init configuration files'
version '0.2.1'
chef_version '>= 12.15'

recipe 'cloud_init::default', 'Deploy cloud-init config from attributes'

supports 'debian', '> 7.0'
supports 'ubuntu', '> 12.04'

source_url 'https://github.com/Numergy/cloud-init-cookbook'
issues_url 'https://github.com/Numergy/cloud-init-cookbook/issues'
