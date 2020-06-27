# frozen_string_literal: true

#
# Cookbook:: codenamephp_system
# Spec:: timezone
#
# Copyright:: 2020, CodenamePHP
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'spec_helper'

describe 'codenamephp_system::timezone' do
  context 'When all attributes are default' do
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'will set the timezone' do
      expect(chef_run).to set_timezone('Set timezone').with(
        timezone: 'Europe/Berlin'
      )
    end
  end

  context 'With custom timezone' do
    override_attributes['codenamephp']['system']['timezone'] = 'some timezone'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'will set the timezone' do
      expect(chef_run).to set_timezone('Set timezone').with(
        timezone: 'some timezone'
      )
    end
  end
end
