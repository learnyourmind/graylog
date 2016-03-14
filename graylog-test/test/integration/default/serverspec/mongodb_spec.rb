require 'spec_helper'

describe 'bcuk-ad::mongodb' do
  
  describe command("rpm -qa | grep mongodb*") do
    its(:stdout) { should match /mongodb/ }
  end

  describe file('/tmp/create-admin.js') do
    it { should exist }
    it { should be_executable }
  end

  describe file('/tmp/create-admin.js') do
    it { should exist }
    it { should be_executable }
  end

  describe command("mongo --eval \"db.system.users.find({user:'admin'}).count()\" admin | tail -1") do
    its(:stdout) { should match /1/ }
  end  

  describe command("mongo --eval \"db.system.users.find({user:'graylog'}).count()\" admin | tail -1") do
    its(:stdout) { should match /1/ }
  end

  describe service('mongod') do
    it { should be_running }
  end

end

