# -*- encoding: utf-8 -*-
require File.expand_path('../lib/appsignal/elasticsearch/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Mike Kim']
  gem.email         = ['mykoweb@gmail.com']
  gem.description   = gem.summary = 'Add Active::Support.instrument calls to ElasticSearch queries'
  gem.homepage      = 'https://github.com/mykoweb/appsignal-elasticsearch'
  gem.license       = 'MIT'

  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'appsignal-elasticsearch'
  gem.require_paths = ['lib']
  gem.version       = Appsignal::Elasticsearch::VERSION

  gem.add_dependency             'appsignal', '> 0.7'
  gem.add_dependency             'elasticsearch', '> 1.0.11'
  gem.add_dependency             'activesupport'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'pry-byebug'
end
