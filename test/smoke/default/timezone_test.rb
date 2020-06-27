# frozen_string_literal: true

describe command('timedatectl') do
  its('stdout') { should match %r{Time zone: Europe/Berlin} }
end
