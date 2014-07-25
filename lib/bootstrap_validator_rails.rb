require 'bootstrap_validator_rails/engine'
require 'bootstrap_validator_rails/form_builder'
require 'bootstrap_validator_rails/helper'
require 'bootstrap_validator_rails/validators/attributes'
require 'bootstrap_validator_rails/validators/generator'
require 'bootstrap_validator_rails/validators/presence_validator'
require 'bootstrap_validator_rails/validators/numericality_validator'
require 'bootstrap_validator_rails/validators/length_validator'

ActionView::Base.send :include, BootstrapValidatorRails::Helper

