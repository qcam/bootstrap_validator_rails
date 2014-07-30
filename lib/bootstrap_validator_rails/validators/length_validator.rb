module BootstrapValidatorRails
  module Validators
    class Length < Validator

      def generate_options!
        @html_attributes ||= {}
        @js_options ||= {}

        return if unsupported?
        
        options = validator_options

        @html_attributes[:bv_stringlength] = 'true'
        @js_options['stringLength'] = {} 

        if options[:minimum]
          @html_attributes[:bv_stringlength_min] = @js_options['stringLength']['min'] = options[:minimum] 
        end

        if options[:maximum]
          @html_attributes[:bv_stringlength_max] = @js_options['stringLength']['max'] = options[:maximum] 
        end

        if options[:is]
          @html_attributes[:bv_stringlength_minimum] = options[:is] 
          @js_options['stringLength']['min'] = options[:is]
          @html_attributes[:bv_stringlength_maximum] = options[:is] 
          @js_options['stringLength']['max'] = options[:is]
          @html_attributes[:bv_stringlength_message] = @js_options['stringLength']['message'] = @record.errors.generate_message(@method) 
        end
      end
    end
  end
end
