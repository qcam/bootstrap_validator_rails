module BootstrapValidatorRails
  module Helper
    def bootstrap_validation_form_for(object, options = {}, &block)
      options.reverse_merge!({builder: BootstrapValidatorRails::FormBuilder})
      bootstrap_form_for(object, options, &block)
    end
  end
end
