$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bootstrap_validator_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bootstrap_validator_rails"
  s.version     = BootstrapValidatorRails::VERSION
  s.authors     = ["huynhquancam"]
  s.email       = ["huynhquancam@gmail.com"]
  s.homepage    = "http://github.com/huynhquancam/bootstrap_validator_rails"
  s.summary     = "BootstrapValidator for Rails"
  s.description = "Rails Form Builder supports Client-side validation using jQuery BootstrapValidator plugin. https://github.com/nghuuphuoc/bootstrapvalidator"
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.files = Dir["{app,config,db,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "bootstrap_form", '~> 2.0'

  s.add_development_dependency "rails", '~> 4.1'
  s.add_development_dependency "sqlite3", '~> 1.3'
  s.add_development_dependency "rspec-rails", '~> 3.0'
end
