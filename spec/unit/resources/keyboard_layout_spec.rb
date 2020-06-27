# frozen_string_literal: true

require 'spec_helper'

describe 'codenamephp_system_keyboard_layout' do
  platform 'debian' # https://github.com/chefspec/chefspec/issues/953

  step_into :codenamephp_system_keyboard_layout
  let(:bash) { chef_run.bash('Execute bash script') }

  context 'Minimal properties' do
    recipe do
      codenamephp_system_keyboard_layout 'Update keyboard layout'
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'Updates the layout' do
      expect(chef_run).to create_template('Update keyboard layout').with(
        path: '/etc/default/keyboard',
        cookbook: 'codenamephp_system',
        source: 'keyboard_layout.erb'
      )
    end

    it 'subscribes to template changes' do
      expect(bash).to subscribe_to('template[Update keyboard layout]').delayed
    end
  end

  context 'With custom cookbook and template' do
    recipe do
      codenamephp_system_keyboard_layout 'Update keyboard layout' do
        cookbook 'some cookbook'
        template_source 'some template'
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'Updates the layout' do
      expect(chef_run).to create_template('Update keyboard layout').with(
        path: '/etc/default/keyboard',
        cookbook: 'some cookbook',
        source: 'some template'
      )
    end
  end
end
