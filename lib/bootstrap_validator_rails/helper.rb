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
          json = @generator.generate_json
          bv_options[:fields].deep_merge! json
        end
      end
      escape_javascript bv_options.to_json.html_safe
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
