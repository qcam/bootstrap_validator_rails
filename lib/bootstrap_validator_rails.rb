require 'bootstrap_validator_rails/engine'
require 'bootstrap_validator_rails/form_builder'
require 'bootstrap_validator_rails/helper'
require 'bootstrap_validator_rails/configuration'
require 'bootstrap_validator_rails/validators/attributes'
require 'bootstrap_validator_rails/validators/generator'
require 'bootstrap_validator_rails/validators/validator'
BootstrapValidatorRails::VALIDATOR_SUPPORTED.each do |v|
  require "bootstrap_validator_rails/validators/#{v}_validator"
end

ActionView::Base.send :include, BootstrapValidatorRails::Helper

