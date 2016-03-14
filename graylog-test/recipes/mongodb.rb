script 'install_mongodb' do
 interpreter 'bash'
  user 'root'
  cwd '/tmp'
  code <<-EOH
  if [[ "#{node['install_family']['install_version']}" == "rhel66" ]]
  then
    wget #{node['mongoorg']['rhel66']}
    rpm -Uvh #{node['mongoorg']['rhel66']}

    wget #{node['mongoserver']['rhel66']}
    rpm -Uvh #{node['mongoserver']['rhel66']}

    wget #{node['mongomongos']['rhel66']}
    rpm -Uvh #{node['mongomongos']['rhel66']}

    wget #{node['mongotools']['rhel66']}
    rpm -Uvh #{node['mongotools']['rhel66']}

    wget #{node['mongoshell']['rhel66']}
    rpm -Uvh #{node['mongoshell']['rhel66']}

  else
    wget #{node['mongoorg']['rhel71']}
    rpm -Uvh #{node['mongoorg']['rhel71']}

    wget #{node['mongoserver']['rhel71']}
    rpm -Uvh #{node['mongoserver']['rhel71']}

    wget #{node['mongomongos']['rhel71']}
    rpm -Uvh #{node['mongomongos']['rhel71']}

    wget #{node['mongotools']['rhel71']}
    rpm -Uvh #{node['mongotools']['rhel71']}

    wget #{node['mongoshell']['rhel71']}
    rpm -Uvh #{node['mongoshell']['rhel71']}

  fi
  EOH
  not_if "rpm -qa | grep mongodb*"
end

service 'mongod' do
  action :restart
end

cookbook_file '/tmp/create-admin.js' do
  source 'create-admin.js'
  owner 'root'
  group 'root'
  mode '0755'
end


cookbook_file '/tmp/create-graylog.js' do
  source 'create-graylog.js'
  owner 'root'
  group 'root'
  mode '0755'
end


script 'configure_mongo' do
  interpreter 'bash'
  user 'root'
  cwd '/tmp'
  code <<-EOH
    sleep 20
    admincnt=`mongo --eval "db.system.users.find({user:'admin'}).count()" admin | tail -1`
    if [[ ${admincnt} == 0 ]]
    then  
       mongo admin /tmp/create-admin.js
    else
	echo "user exists: $admincnt"
    fi
    graylogcnt=`mongo --eval "db.system.users.find({user:'graylog'}).count()" admin | tail -1` 
    if [[ ${graylogcnt} == 0 ]]
    then
	mongo graylog2 /tmp/create-graylog.js
    else
        echo "user exists: $graylogcnt"
    fi
  EOH
end

