# -*- coding: utf-8 -*-
require 'serverspec'
set :backend, :exec

describe file '/etc/cloud/cloud.cfg.d/42_hostname.cfg' do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:content) { should match(/preserve_hostname: true/) }
end
