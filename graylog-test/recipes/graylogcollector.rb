script 'install_graylogcollector' do
  interpreter 'bash'
  user 'root'
  cwd '/tmp'
  code <<-EOH
    wget #{node['glcollector']['rpm']}
    rpm -Uvh #{node['glcollector']['rpm']}
  EOH
  not_if "rpm -qa | grep graylog-collector*"
end

template '/etc/graylog/collector/collector.conf' do
  source 'glcollector.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
	:glserver => node['graylog']['server'],
	:securename => node['secure']['name'],
	:messagesname => node['messages']['name'],
	:bootname => node['boot']['name'],
	:cronname => node['secure']['name'],
	:mailname => node['secure']['name'],
	:yumname => node['yum']['name'],
	:lastname => node['last']['name'],
        :securepath => node['secure']['path'],
        :messagespath => node['messages']['path'],
        :bootpath => node['boot']['path'],
        :cronpath => node['cron']['path'],
        :mailpath => node['mail']['path'],
        :yumpath => node['yum']['path'],
	:lastpath => node['last']['path'],
	:agent => node['ipaddress'],
	:listenport => node['listen']['port']
	)
end

service 'graylog-collector' do
  action :restart
end

