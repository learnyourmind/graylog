script 'install_elasticsearch' do
  interpreter 'bash'
  user 'root'
  cwd '/tmp'
  code <<-EOH
      wget http://172.21.68.11/tools/elasticsearch-1.7.2.noarch.rpm
      rpm -Uvh elasticsearch-1.7.2.noarch.rpm
  EOH
  not_if "rpm -qa | grep elasticsearch-1.7.2.noarch.rpm"
end

template '/etc/elasticsearch/elasticsearch.yml' do
  source 'elasticsearch.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
	:graylog_cluster => node['graylog']['cluster'],
	:mc_flag => node['multicast']['flag'],
	:elasticip => node['ipaddress']
	)
end

service 'elasticsearch' do
  action :restart
end
