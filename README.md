cloud_init Cookbook
===================

Deploy cloud_init configuration files from attributes or LWRP.

[![Cookbook Version](https://img.shields.io/cookbook/v/cloud_init.svg)](https://community.opscode.com/cookbooks/cloud_init) [![Build Status](https://travis-ci.org/Numergy/cloud-init-cookbook.svg?branch=master)](https://travis-ci.org/Numergy/cloud-init-cookbook) 

Requirements
------------

#### Platforms
The following platforms and versions are tested and supported using Opscode's test-kitchen.
- `Debian 8`
- `Debian 9`
- `Debian 10`
- `Ubuntu 16.04`
- `Ubuntu 18.04`
- `Ubuntu 20.04`

Attributes
----------
#### cloud_init::default

|  Key                 | Type |  Description                                |
| -------------------- | ---- | ------------------------------------------- |
| `[cloud_init][cfgs]` | Hash | Hash of configuration files (default: `{}`) |

Usage
-----
#### cloud_init::default
Include `cloud_init` in your node's `run_list` and set the `cfgs` attribute to install `cloud-init` package and create configuration files:

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

#### cloud_init::upgrade
Include `cloud_init::upgrade` in your node's `run_list` to upgrade `cloud-init` package.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[cloud_init::upgrade]"
  ]
}
```

#### cloud_init::disable
Include `cloud_init::disable` in your node's `run_list` to disable `cloud-init`.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[cloud_init::disable]"
  ]
}
```

#### cloud_init::enable
Include `cloud_init::enable` in your node's `run_list` to enable `cloud-init`.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[cloud_init::enable]"
  ]
}
```

#### cloud_init::remove
Include `cloud_init::remove` in your node's `run_list` to remove `cloud-init` package.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[cloud_init::remove]"
  ]
}
```

#### cloud_init::purge
Include `cloud_init::purge` in your node's `run_list` to purge `cloud-init` package and remove cloud directories (`/etc/cloud`, `/var/lib/cloud`).

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[cloud_init::purge]"
  ]
}
```

#### Custom resources

##### cloud_init
This LWRP can be used to manipulate `cloud-init` package.

###### Actions
| Action     | Description                                       |
| ---------  | ------------------------------------------------- |
| `:install` | Install `cloud-init`                              |
| `:upgrade` | Upgrade `cloud-init`                              |
| `:disable` | Disable `cloud-init`                              |
| `:enable`  | Enable `cloud-init`                               |
| `:remove`  | Remove `cloud-init`                               |
| `:purge`   | Purge `cloud-init` and remove configuration files |


###### Attributes
This LWRP doesn't have any attributes, the name attribute can be whatever.

###### Examples
Install `cloud-init`:
```ruby
cloud_init 'default'
```

Disable `cloud-init`:
```ruby
cloud_init 'default' do
  action :disable
end
```

Purge `cloud-init`:
```ruby
cloud_init 'default' do
  action :purge
end
```

##### cloud_init_cfg
This LWRP can be used to deploy `cloud-init` configuration files.

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
| `config`   | Hash     | Hash configuration, used by the template.                                     |


###### Example
```ruby
cloud_init 'default'

cloud_init_cfg 'hostname' do
  priority 90
  config preserve_hostname: true
end
```

Testing
-------
See [TESTING.md](TESTING.md)

Contributing
------------
See [CONTRIBUTING.md](CONTRIBUTING.md)

License and Authors
-------------------
Authors: Sliim <sliim@mailoo.org> 

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
