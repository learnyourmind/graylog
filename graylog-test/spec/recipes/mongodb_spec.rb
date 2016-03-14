require_relative '../spec_helper'

describe 'bcuk-graylog::mongodb' do

    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    before do
  	stub_command("rpm -qa | grep mongodb*").and_return(false)
    end
	
    it 'run install script for MongoDB' do
        expect(chef_run).to run_script("install_mongodb")
    end

    it 'run Mongod service' do
        expect(chef_run).to restart_service("mongod")
    end

    it 'copy create-admin.js file' do
        expect(chef_run).to create_cookbook_file("/tmp/create-admin.js")
    end
  
    it 'copy create-graylog.js file' do
	expect(chef_run).to create_cookbook_file("/tmp/create-graylog.js")
    end 

    it 'runs Mongo user add script' do
        expect(chef_run).to run_script("configure_mongo")
    end
end
