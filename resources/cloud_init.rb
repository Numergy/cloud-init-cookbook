# Cookbook:: cloud_init
# Resource:: cloud_init
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

resource_name :cloud_init
provides :cloud_init
default_action :install

action :install do
  package 'cloud-init'
end

action :disable do
  directory '/etc/cloud' do
    action :create
  end

  file '/etc/cloud/cloud-init.disabled' do
    action :create
  end
end

action :upgrade do
  package 'cloud-init' do
    action :upgrade
  end
end

action :remove do
  package 'cloud-init' do
    action :remove
  end
end

action :purge do
  package 'cloud-init' do
    action :purge
  end

  ['/etc/cloud', '/var/lib/cloud'].each do |dir|
    directory dir do
      action :delete
      recursive true
    end
  end
end
