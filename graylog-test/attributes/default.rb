default['graylog']['cluster']='graylog2'
default['multicast']['flag']='false'

default['admin']['user']='admin'
default['admin']['password']='240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9' #Real password is admin123

default['zenping']['mcflag']='false'
default['mongo']['user']='graylog'
default['mongo']['password']='graylog'

default['rpm']['base']='http://172.21.68.11/tools/'

default['install_family'] = node['platform_family']
default['install_version'] = node['platform_version'].gsub(/[^0-9]/, '')

default['os']['suite']['name'] = "#{node['install_family']}".concat("#{node['install_version']}")

#Mongo DB RHEL 7 RPM's

default['mongoorg']['rhel71']= node['rpm']['base'] + 'mongodb-org-3.0.6-1.el7.x86_64.rpm'
default['mongoserver']['rhel71']= node['rpm']['base'] + 'mongodb-org-server-3.0.6-1.el7.x86_64.rpm'
default['mongomongos']['rhel71']= node['rpm']['base'] + 'mongodb-org-mongos-3.0.6-1.el7.x86_64.rpm'
default['mongoshell']['rhel71']= node['rpm']['base'] + 'mongodb-org-shell-3.0.6-1.el7.x86_64.rpm'
default['mongotools']['rhel71']= node['rpm']['base'] + 'mongodb-org-tools-3.0.6-1.el7.x86_64.rpm'

#Mongo DB RHEL 6 RPM's

default['mongoorg']['rhel66']= node['rpm']['base'] + 'mongodb-org-3.0.6-1.el6.x86_64.rpm'
default['mongoserver']['rhel66']= node['rpm']['base'] + 'mongodb-org-server-3.0.6-1.el6.x86_64.rpm'
default['mongomongos']['rhel66']= node['rpm']['base'] + 'mongodb-org-mongos-3.0.6-1.el6.x86_64.rpm'
default['mongoshell']['rhel66']= node['rpm']['base'] + 'mongodb-org-shell-3.0.6-1.el6.x86_64.rpm'
default['mongotools']['rhel66']= node['rpm']['base'] + 'mongodb-org-tools-3.0.6-1.el6.x86_64.rpm'

#Graylog RHEL 7 RPM's

default['glserver']['rhel71']= node['rpm']['base'] + 'graylog-server-1.2.1-1.noarch.rpm'
default['glweb']['rhel71']= node['rpm']['base'] + 'graylog-web-1.2.1-1.noarch.rpm'

#Graylog RHEL 6 RPM's

default['glserver']['rhel66']= node['rpm']['base'] + 'graylog-server-1.2.1-1.noarch6.rpm'
default['glweb']['rhel66']= node['rpm']['base'] + 'graylog-web-1.2.1-1.noarch6.rpm'

# Graylog Collector parameters
default['is']['collector']='false'
default['glcollector']['rpm'] = node['rpm']['base'] + 'graylog-collector-0.4.1-1.noarch.rpm'
default['graylog']['server']='172.21.64.41'
default['secure']['name']='secure'
default['secure']['path']='/var/log/secure'

default['messages']['name']='messages'
default['messages']['path']='/var/log/messages'

default['boot']['name']='boot-log'
default['boot']['path']='/var/log/boot.log'

default['cron']['name']='cron'
default['cron']['path']='/var/log/cron'

default['mail']['name']='mail'
default['mail']['path']='/var/log/maillog'

default['yum']['name']='yum'
default['yum']['path']='/var/log/yum.log'

default['last']['name']='lastlog'
default['last']['path']='/var/log/lastlog'
default['listen']['port']='12201'
