# -*- coding: utf-8 -*-

cloud_init_cfg 'hostname' do
  priority 42
  config preserve_hostname: true
end
