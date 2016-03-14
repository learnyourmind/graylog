template '/etc/hosts' do
  source 'client-config.erb'
  owner 'root'
  group 'root'
  mode '0644'
 variables(
        :glserver => node['graylog']['server']
	)
end

script 'log_permission' do
  interpreter 'bash'
  user 'root'
  cwd '/var/log/'
  code <<-EOH
	chmod 644 messages secure boot.log maillog cron lastlog yum.log
	echo "<%= @glserver %>	uk-coreglprdv01.do.ez  uk-coreglprdv01" >> /etc/hosts
	EOH
end


