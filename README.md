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

## Attributes

### Keyboard Layout
- `default['codenamephp']['system']['keyboardLayout']['XKBMODEL']`: The keyboard model, defaults to `'pc105'`
- `default['codenamephp']['system']['keyboardLayout']['XKBLAYOUT']`: The keyboard layout(s)/language(s), can be a CSV list, defaults to `'de'`
- `default['codenamephp']['system']['keyboardLayout']['XKBVARIANT']`: The keyboard variant, defaults to `''`
- `default['codenamephp']['system']['keyboardLayout']['XKBOPTIONS']`: Additional xkboptions, defaults to `''`
- `default['codenamephp']['system']['keyboardLayout']['BACKSPACE']`: How to find the backspace key, defaults to `'guess'`

### Locale
- `default['codenamephp']['system']['locale']`: The system locale to set, defaults to `'de_DE.UTF-8'`

### Timezone
- `default['codenamephp']['system']['timezone']`: The system timezone to set, defaults to `'Europe/Berlin'`

## Resources
### Keyboard Layout
The `codenamephp_system_keyboard_layout` sets you default system keyboard layout by replacing `/etc/default/keyboard` with a template where the model,
layout and all other XKB settings can be set using attributes. It also sets up monitoring when the template changes during the chef run and informs
all dependent services.

You can also pass your own template and set attributes as you like them.

#### Actions
- `:update`: Updates the template and restarts services if needed

#### Properties
- `cookbook`: The name of the cookbook where the template can be found, defaults to `'codenamephp_system`
- `template_source`: The name of the template file, defaults to `'keyboard_layout.erb'`

#### Examples
```ruby
# Minimal properties
codenamephp_system_keyboard_layout 'Update keyboard layout'

# With custom template
codenamephp_system_keyboard_layout 'Update keyboard layout' do
  cookbook 'my_cookbook'
  template_source 'my_template.erb'
end
```

## Recipes
### Keyboard Layout
The `::keyboard_layout` recipe is just a shurtcut that calls the `codenamephp_system_keyboard_layout` without properties

### Locale
The `::locale` recipe just uses the chef `locale` resource with the value from `default['codenamephp']['system']['locale']`

### Timezone
The `::timezone` recipe just uses the chef `timezone` resource with the value from `default['codenamephp']['system']['timezone']`