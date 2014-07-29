module BootstrapValidatorRails
  module Helper
    def bootstrap_validation_form_for(object, options = {}, &block)
      options.reverse_merge!({builder: BootstrapValidatorRails::FormBuilder})
      bootstrap_form_for(object, options, &block)
    end

    def bv_options_for(object)
      validators = object.class.validators

      bv_options = {
        fields: {}
      }

      validators.each do |validator|
        methods = validator.attributes
        methods.each do |method|
          @generator = BootstrapValidatorRails::Validators::Generator.new(object, validator, method)
          bv_options[:fields].merge! @generator.generate_json
        end
      end

      bv_options.to_json.html_safe
    end
  end
end
