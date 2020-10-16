source 'https://rubygems.org'

chef = (ENV['CHEF_VERSION'] || 13).to_i

gem 'chef', "~> #{chef}"
gem 'berkshelf'
gem 'rake'

group :lint do
  gem 'cookstyle'
  gem 'foodcritic'
end

group :kitchen do
  gem 'test-kitchen'
  gem 'kitchen-docker'
  gem 'kitchen-inspec', chef <= 12 ? '= 1.2.0' : '~> 2'
end
