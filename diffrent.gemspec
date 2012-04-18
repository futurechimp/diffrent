# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "diffrent"
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dave Hrycyszyn"]
  s.date = "2012-04-18"
  s.description = "Diffrent is a very simple way to do ActiveRecord version \n      diffing. It provides a convenient interface to two other libraries \n      (Diffy and Vestal Versions), combining their functionality. \n\n      It makes no assumption about what web framework you're using - it can be \n      used in Sinatra, Padrino, Rails, or with no framework at all. "
  s.email = "dave.hrycyszyn@headlondon.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "diffrent.gemspec",
    "lib/diffrent.rb",
    "test/helper.rb",
    "test/test_diffrent.rb"
  ]
  s.homepage = "http://github.com/futurechimp/diffrent"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.17"
  s.summary = "Simple ActiveRecord version diffing"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<diffy>, [">= 0"])
      s.add_runtime_dependency(%q<vestal_versions>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<diffy>, [">= 0"])
      s.add_dependency(%q<vestal_versions>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<diffy>, [">= 0"])
    s.add_dependency(%q<vestal_versions>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

