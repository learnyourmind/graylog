require_relative '../spec_helper'

describe 'bcuk-ad::adhost' do

    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    before do
	stub_command("rpm -qa | grep samba").and_return(false)
	stub_command("rpm -qa | grep samba-client").and_return(false)
        stub_command("rpm -qa | grep samba-common").and_return(false)
	stub_command("rpm -qa | grep samba-winbind").and_return(false)
	stub_command("rpm -qa |grep oddjob-mkhomedir").and_return(false)
	stub_command("rpm -qa |grep samba-winbind-clients").and_return(false)
    end
	
    it 'install packages' do
        expect(chef_run).to install_package("samba")
    end

    it 'install samba-client packages' do
        expect(chef_run).to install_package("samba-client")
    end

    it 'install samba-common packages' do
        expect(chef_run).to install_package("samba-common")
    end

    it 'install samba-winbind packages' do
        expect(chef_run).to install_package("samba-winbind")
    end

    it 'install oddjob-mkhomedir packages' do
        expect(chef_run).to install_package("oddjob-mkhomedir")
    end


    it 'installs samba-winbin-clients' do
	expect(chef_run).to install_package("samba-winbind-clients")
    end

    it 'create file resolv conf' do
        expect(chef_run).to create_template("/etc/resolv.conf")
    end

     it 'create file ntp conf' do
        expect(chef_run).to create_template("/etc/ntp.conf")
    end

     it 'create hosts' do
        expect(chef_run).to create_template("/etc/hosts")
    end

    it 'copy key.txt file' do
        expect(chef_run).to create_cookbook_file("/tmp/key.txt")
    end

    it 'copy adbind.txt file' do
        expect(chef_run).to create_cookbook_file("/tmp/adbind.txt")
    end

     it 'create krb5 conf file' do
        expect(chef_run).to create_template("/etc/krb5.conf")
    end

     it 'create samba conf file' do
        expect(chef_run).to create_template("/etc/samba/smb.conf")
    end

     it 'create nsswitch conf file' do
        expect(chef_run).to create_template("/etc/nsswitch.conf")
    end

     it 'creates pam sshd conf file' do
        expect(chef_run).to create_template("/etc/pam.d/sshd")
    end

     it 'create password-auth conf' do
        expect(chef_run).to create_template("/etc/pam.d/password-auth")
    end
   
    it 'create system-auth conf' do
	expect(chef_run).to create_template("/etc/pam.d/system-auth")
    end

    it 'create sshd  conf' do
        expect(chef_run).to create_template("/etc/ssh/sshd_config")
    end

    it 'run smb service' do
	expect(chef_run).to restart_service("smb")
    end

    it 'run oddjobd service' do
	expect(chef_run).to restart_service("oddjobd")
    end

    it 'run ntpd service' do
        expect(chef_run).to restart_service("ntpd")
    end

    it 'runs a script' do
	expect(chef_run).to run_script("kerberos_config")
    end

    it 'runs AD services config script' do
	expect(chef_run).to run_script("adservices_config")
    end

    it 'runs services config script' do
        expect(chef_run).to run_script("services_config")
    end

    it 'run sshd service' do
        expect(chef_run).to restart_service("sshd")
    end
   
    it 'run winbind service' do
        expect(chef_run).to restart_service("winbind")
    end


end

