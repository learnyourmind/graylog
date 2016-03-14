require 'spec_helper'

describe 'bcuk-ad::mongodb' do
  
  describe command("rpm -qa | grep elasticsearch") do
    its(:stdout) { should match /elasticsearch/ }
  end

  describe file('/etc/elasticsearch/elasticsearch.yml') do
    it { should exist }
    it { should_not be_executable }
  end

  describe command("grep graylog2 /etc/elasticsearch/elasticsearch.yml") do
    its(:stdout) { should match /cluster.name: graylog2/ }
  end  

  describe service('elasticsearch') do
    it { should be_running }
  end

end

