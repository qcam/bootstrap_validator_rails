$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bootstrap_validator_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bootstrap_validator-rails"
  s.version     = BootstrapValidatorRails::VERSION
  s.authors     = ["huynhquancam"]
  s.email       = ["huynhquancam@gmail.com"]
  s.homepage    = "http://github.com/huynhquancam/bootstrap_validator-rails"
  s.summary     = "BootstrapValidator for Rails"
  s.description = "BootstrapValidator for Rails. https://github.com/nghuuphuoc/bootstrapvalidator"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"

  s.add_development_dependency "sqlite3"
end
