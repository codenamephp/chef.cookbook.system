# frozen_string_literal: true

describe command('cat /etc/locale.conf') do
  its('stdout') { should match(/LANG=de_DE.UTF-8/) }
end
