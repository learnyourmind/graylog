require_relative '../spec_helper'

describe 'bcuk-graylog::graylog' do

    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    before do
	stub_command("rpm -qa | grep graylog-server*").and_return(false)
	stub_command("rpm -qa | grep graylog-web*").and_return(false)
    end

    it 'Runs Graylog install script' do
        expect(chef_run).to run_script("install_graylog")
    end

    it 'runs services config script' do
        expect(chef_run).to run_script("install_graylogweb")
    end

    it 'install pwgen packages' do
        expect(chef_run).to install_package("pwgen")
    end

    it 'create graylog server conf' do
        expect(chef_run).to create_template("/etc/graylog/server/server.conf")
    end
 
    it 'create graylog web conf' do
        expect(chef_run).to create_template("/etc/graylog/web/web.conf")
    end

    it 'Copy Passadd script' do
        expect(chef_run).to create_cookbook_file("/tmp/passadd.sh")
    end

    it 'Run passadd script' do
        expect(chef_run).to run_script("run_passadd")
    end

    it 'Runs Graylog server service' do
        expect(chef_run).to restart_service("graylog-server")
    end

    it 'Runs Graylog web service' do
        expect(chef_run).to restart_service("graylog-web")
    end 
	
end

