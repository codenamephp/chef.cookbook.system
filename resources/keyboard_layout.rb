# frozen_string_literal: true

property :cookbook, String, default: 'codenamephp_system', description: 'The cookbook that contains the template, defaults to codenamephp_system'
property :template_source, String, default: 'keyboard_layout.erb', description: 'The name of the template, defaults to keyboard_layout.erb'

action :update do
  template 'Update keyboard layout' do
    path '/etc/default/keyboard'
    cookbook new_resource.cookbook
    source new_resource.template_source
  end

  bash 'Execute bash script' do
    action :nothing
    code <<~COMMANDS
      sudo service keyboard-setup restart;
      sudo setupcon;
      sudo update-initramfs -u;
      sudo setxkbmap de;
      sudo udevadm trigger --subsystem-match=input --action=change;
    COMMANDS
    subscribes :run, 'template[Update keyboard layout]', :delayed
  end
end
