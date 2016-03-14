require_relative '../spec_helper'

describe 'bcuk-graylog::graylogcollector' do

    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    before do
	stub_command("rpm -qa | grep graylog-collector*").and_return(false)
    end

    it 'Runs Graylog Collector install script' do
        expect(chef_run).to run_script("install_graylogcollector")
    end

    it 'create graylog collector conf' do
        expect(chef_run).to create_template("/etc/graylog/collector/collector.conf")
    end
 
    it 'Runs Graylog collector service' do
        expect(chef_run).to restart_service("graylog-collector")
    end

end
