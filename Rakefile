# -*- coding: utf-8 -*-

def bundle_exec(command)
  sh "bundle exec #{command}"
end

task :vendor do
  rm_rf 'cookbooks'
  bundle_exec 'berks vendor cookbooks'
end

namespace :test do
  desc 'Tests suites runner'

  task :checkstyle do
    Rake::Task['test:foodcritic'].invoke
    Rake::Task['test:cookstyle'].invoke
  end

  task :foodcritic do
    bundle_exec 'foodcritic -f any .'
  end

  task :cookstyle do
    bundle_exec :cookstyle
  end

  task :kitchen do
    bundle_exec 'kitchen test --concurrency'
  end
end

task default: ['test:checkstyle']
