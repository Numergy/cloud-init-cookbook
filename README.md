cloud_init Cookbook
===================

Deploy cloud_init configuration files from attributes or LWRP.

[![Cookbook Version](https://img.shields.io/cookbook/v/cloud_init.svg)](https://community.opscode.com/cookbooks/cloud_init) [![Build Status](https://travis-ci.org/Numergy/cloud-init-cookbook.svg?branch=master)](https://travis-ci.org/Numergy/cloud-init-cookbook) 

Requirements
------------

#### Platforms
The following platforms and versions are tested and supported using Opscode's test-kitchen.
- `Debian 7`
- `Debian 8`
- `Ubuntu 12.04`
- `Ubuntu 14.04`

Attributes
----------
#### cloud_init::default

|  Key                 | Type |  Description                                |
| -------------------- | ---- | ------------------------------------------- |
| `[cloud_init][cfgs]` | Hash | Hash of configuration files (default: `{}`) |

Usage
-----
#### cloud_init::default
Include `cloud_init` in your node's `run_list` and set the `cfgs` attribute to create configuration files:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[cloud_init]"
  ],
  "attributes": {
    "cloud_init": {
      "cfgs": {
        "hostname": {
          "priority": "90",
          "config": {
            "preserve_hostname": "true"
          }
        }
      }
    }
  }
}
```

This setup will create the configuration file `/etc/cloud/cloud.cfg.d/90_hostname.cfg` with following content:
```
preserve_hostname: true
```

#### Custom resources

##### cloud_init_cfg
This LWRP can be used to deploy cloud_init configuration files.

###### Actions
|  Action   |  Description                           |
| --------- | -------------------------------------- |
| `:create` | Create a cloud-init configuration file |
| `:delete` | Delete a cloud-init configuration file |

###### Attributes
| Attribute  |  Type    |  Description                                                                  |
| ---------- | -------- | ----------------------------------------------------------------------------- |
| `name`     | String   | Name of the configuration file, this is the name attribute                    |
| `priority` | Interger | Priority of configuration file, The config filename is prefixed by this value |
| `config`   | Hash     | Hash configuration, used by the template.                                 |


###### Example
```ruby
cloud_init_cfg 'hostname' do
  priority 90
  config preserve_hostname: true
end
```

Tests
-----

- First, install dependencies:  
`bundle install`

- Run Checkstyle and ChefSpec:  
`bundle exec rake`

- Run Kitchen tests:
`bundle exec rake kitchen`

Docker driver is used for integration testing with test-kitchen. You will need to have docker installed to run integration testing, or adapt the existing .kitchen.yml for your driver.

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Sliim <sliim@mailoo.org> 

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
