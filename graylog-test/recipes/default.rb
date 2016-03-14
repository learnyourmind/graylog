#
# Cookbook Name:: bcuk-graylog
# Recipe:: default
#
# Copyright 2015, Barclays Bank
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

cookbook_file '/etc/yum.repos.d/epel.repo' do
  source 'epel.repo'
  owner 'root'
  group 'root'
  mode '0644'
end
include_recipe 'client-config'

#include_recipe 'bcuk-graylog::mongodb'
#include_recipe 'bcuk-graylog::elasticsearch'
#include_recipe 'bcuk-graylog::graylog'

#if node['is']['collector'] == 'true'
  include_recipe 'bcuk-graylog::graylogcollector'
#end
