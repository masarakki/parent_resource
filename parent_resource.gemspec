$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'parent_resource/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'parent_resource'
  s.version     = ParentResource::VERSION
  s.authors     = ['masarakki']
  s.email       = ['masaki@hisme.net']
  s.homepage    = 'https://github.com/masarakki/parent_resource'
  s.summary     = 'auto set parent_resources in controller.'
  s.description = 'auto set parent_resources in controller.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '> 3.2.0'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-rubocop'
  s.add_development_dependency 'coveralls'
end
