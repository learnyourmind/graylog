require_relative '../spec_helper'

describe 'bcuk-ad::adsudo' do

    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end
	
    it 'create sudo  conf file' do
        expect(chef_run).to create_template("/etc/pam.d/sudo")
    end

     it 'create sudo-i conf file' do
        expect(chef_run).to create_template("/etc/pam.d/sudo-i")
    end

     it 'create su conf file' do
        expect(chef_run).to create_template("/etc/pam.d/su")
    end

     it 'create su-l conf file' do
        expect(chef_run).to create_template("/etc/pam.d/su-l")
    end

     it 'create system-auth-ac  conf file' do
        expect(chef_run).to create_template("/etc/pam.d/system-auth-ac")
    end

     it 'create sudoers conf file' do
        expect(chef_run).to create_template("/etc/sudoers")
    end

     it 'create sudoers admin access conf' do
        expect(chef_run).to create_template("/etc/sudoers.d/99-ad-admin-access")
    end
   
end
