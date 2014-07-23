require 'bootstrap_validator_rails/engine'
require 'bootstrap_validator_rails/form_builder'
require 'bootstrap_validator_rails/helper'

ActionView::Base.send :include, BootstrapValidatorRails::Helper

