# Chef Cookbook System
[![Build Status](https://travis-ci.com/codenamephp/chef.cookbook.system.svg?branch=master)](https://travis-ci.com/codenamephp/chef.cookbook.system)

## Requirements

### Supported Platforms

- Debian Stretch

### Chef

- Chef 13.0+

### Cookbook Depdendencies

## Usage

Add the cookbook to your Berksfile:

```
cookbook 'codenamephp_system'
```

Add the cookbook to your runlist, e.g. in a role:


```json
{
  "name": "default",
  "chef_type": "role",
  "json_class": "Chef::Role",
  "run_list": [
	  "recipe[codenamephp_system]"
  ]
}
```
