require 'bootstrap_form'

module BootstrapValidatorRails
  class FormBuilder < BootstrapForm::FormBuilder
    def validators_of(method)
      object.class.validators_on(method)
    end
    
    def generate_validation_message(method)
      object.errors.generate_message(method, :presence, default: "is required")
    end

    def text_field(method, options = {})
      validators = validators_of(method)
      validator_messages = {}
      validators.each do |validator|
        if validator.kind == :presence
          validator_messages[:mv_notempty] = '' 
          validator_messages[:mv_notempty_message] = generate_validation_message(method)
        end
      end
      options[:data] = {}
      options[:data] = options[:data].merge(validator_messages)
      super
    end
  end
end

module BootstrapValidatorRails
  module Helper
    def validated_bootstrap_form_for(object, options = {}, &block)
      options.reverse_merge!({builder: BootstrapValidatorRails::FormBuilder})
      bootstrap_form_for(object, options, &block)
    end
  end
end

ActionView::Base.send :include, BootstrapValidatorRails::Helper
