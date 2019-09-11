# -*- coding: utf-8 -*-
source 'https://rubygems.org'

gem 'chef', "~> #{ENV['CHEF_VERSION'] || 13}"
gem 'berkshelf'
gem 'rake'

group :lint do
  gem 'cookstyle'
  gem 'foodcritic'
end

group :kitchen do
  gem 'test-kitchen'
  gem 'kitchen-docker'
end
