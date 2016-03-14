script 'install_graylog' do
  interpreter 'bash'
  user 'root'
  cwd '/tmp'
  code <<-EOH
     if [[ "#{node['install_family']['install_version']}" == "rhel66" ]]
     then
	wget #{node['glserver']['rhel66']}
    	rpm -Uvh #{node['glserver']['rhel66']}
     else
 	wget #{node['glserver']['rhel71']}
        rpm -Uvh #{node['glserver']['rhel71']}
     fi
  EOH
  not_if "rpm -qa | grep graylog-server*"
end

script 'install_graylogweb' do
  interpreter 'bash'
  user 'root'
  cwd '/tmp'
  code <<-EOH
    if [[ "#{node['install_family']['install_version']}" == "rhel66" ]]
     then
        wget #{node['glweb']['rhel66']}
        rpm -Uvh #{node['glweb']['rhel66']}
     else
        wget #{node['glweb']['rhel71']}
        rpm -Uvh #{node['glweb']['rhel71']}
     fi
  EOH
  not_if "rpm -qa | grep graylog-web*"
end

package 'pwgen' do
  action :install
end

template '/etc/graylog/server/server.conf' do
  source 'glserverconf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
	:adminpass => node['admin']['password'],
        :adminuser => node['admin']['user'],
	:zenpingenabled => node['zenping']['mcflag'],
	:uchosts => node['ipaddress'],
	:mongouser => node['mongo']['user'],
	:mongopass => node['mongo']['password'],
	:glcluster => node['graylog']['cluster'],
	:ipaddress => node['ipaddress']
	)
end

template '/etc/graylog/web/web.conf' do
  source 'glwebconf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
        :ipaddress => node['ipaddress']
        )
end


cookbook_file '/tmp/passadd.sh' do
  source 'passadd.sh'
  owner 'root'
  group 'root'
  mode '0755'
end

script 'run_passadd' do
  interpreter 'bash'
  user 'root'
  cwd '/tmp'
  code <<-EOH
 	/tmp/passadd.sh 
  EOH
end

service 'graylog-server' do
  action :restart
end

service 'graylog-web' do
  action :restart
end
