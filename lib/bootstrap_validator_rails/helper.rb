require 'bootstrap_form'

module BootstrapValidatorRails
  module Helper
    def bootstrap_validation_form_for(object, options = {}, &block)
      ActiveSupport::Deprecation.warn("bootstrap_validation_form_for is deprecated. Use bv_form_for instead.")
      bv_form_for(object, options, &block)
    end

    def bv_form_for(object, options = {}, &block)
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
          js_options = @generator.generate_js_options
          bv_options[:fields].deep_merge! js_options
        end
      end
      bv_options.to_json.html_safe
    end

    def bv_javascript_for(object)
      javascript_tag("
        $(document).ready(function() {
          bv_form('.bv_form', #{bv_options_for(object)})
        });
      ")
    end
  end
end
