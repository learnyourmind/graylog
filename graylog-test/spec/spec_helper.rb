# Base spec which includes chefspec libraries
require 'chefspec'
require 'chef-sudo'
require 'chefspec/berkshelf'

at_exit { ChefSpec::Coverage.report! }
