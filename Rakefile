# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "diffrent"
  gem.homepage = "http://github.com/futurechimp/diffrent"
  gem.license = "MIT"
  gem.summary = %Q{Simple ActiveRecord version diffing}
  gem.description = %Q{Diffrent is a very simple way to do ActiveRecord version 
      diffing. It provides a convenient interface to two other libraries 
      (Diffy and Vestal Versions), combining their functionality. 

      It makes no assumption about what web framework you're using - it can be 
      used in Sinatra, Padrino, Rails, or with no framework at all. }
  gem.email = "dave.hrycyszyn@headlondon.com"
  gem.authors = ["Dave Hrycyszyn"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "diffrent #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
