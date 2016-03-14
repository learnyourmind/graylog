require 'spec_helper'

describe 'bcuk-ad::graylog' do
  
  describe command("rpm -qa | grep graylog") do
    its(:stdout) { should match /graylog/ }
  end

  describe file('/etc/graylog/server/server.conf') do
    it { should exist }
    it { should_not be_executable }
  end

  describe file('/etc/graylog/web/web.conf') do
    it { should exist }
    it { should_not be_executable }
  end

  describe file('/etc/graylog/web/application.conf') do
    it { should exist }
    it { should_not be_executable }
  end

  describe service('graylog-server') do
    it { should be_running }
  end

  describe service('graylog-web') do
    it { should be_running }
  end

end

