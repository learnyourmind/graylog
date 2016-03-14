require_relative '../spec_helper'

describe 'bcuk-graylog::elasticsearch' do

    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    before do
	stub_command("rpm -qa | grep elasticsearch-1.7.2.noarch.rpm").and_return(false)
    end

    it 'Runs elasticsearch install script' do
        expect(chef_run).to run_script("install_elasticsearch")
    end

    it 'create elasticseach.yml conf' do
        expect(chef_run).to create_template("/etc/elasticsearch/elasticsearch.yml")
    end

    it 'run elasticsearch service' do
        expect(chef_run).to restart_service("elasticsearch")
    end
	
end

