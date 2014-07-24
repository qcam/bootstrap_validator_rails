require 'bootstrap_validator_rails/engine'
require 'bootstrap_validator_rails/form_builder'
require 'bootstrap_validator_rails/helper'
require 'bootstrap_validator_rails/validator_message'

ActionView::Base.send :include, BootstrapValidatorRails::Helper

