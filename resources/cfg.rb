# -*- coding: utf-8 -*-
#
# Cookbook Name:: cloud_init
# Resource:: cfg
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

resource_name :cloud_init_cfg
provides :cloud_init_cfg

property :name, String
property :priority, Integer, default: 99
property :config, [Array, Hash, Mash], default: {}

action :create do
  name = new_resource.name
  priority = new_resource.priority

  directory '/etc/cloud/cloud.cfg.d' do
    owner 'root'
    group 'root'
    mode '0755'
    recursive true
  end

  template "/etc/cloud/cloud.cfg.d/#{priority}_#{name}.cfg" do
    owner 'root'
    group 'root'
    mode '0644'
    source 'cfg.erb'
    variables config: new_resource.config
    cookbook 'cloud_init'
  end

  new_resource.updated_by_last_action(true)
end

action :delete do
  name = new_resource.name
  priority = new_resource.priority

  file "/etc/cloud/cloud.cfg.d/#{priority}_#{name}.cfg" do
    action :delete
  end

  new_resource.updated_by_last_action(true)
end
