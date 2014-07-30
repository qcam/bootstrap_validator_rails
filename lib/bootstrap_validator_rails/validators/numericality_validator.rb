module BootstrapValidatorRails
  module Validators
    class Numericality < Validator
      def generate_message
        @record.errors.generate_message(@method, :presence, {default: 'should be a number'})
      end

      def generate_options!
        return if unsupported?

        options = @validator.options

        @html_attributes[:bv_numeric] = 'true'
        @html_attributes[:bv_numeric_separator] = '.'

        @js_options['numeric'] = {}
        @js_options['numeric']['separator'] = ','

        if options[:only_integer].present?
          @html_attributes[:bv_integer] = 'true'
          @html_attributes[:bv_integer_message] = 'should be a number'
          @js_options['integer'] = {}
          @js_options['integer']['message'] = 'should be a number'
        end

        if options[:greater_than].present?
          @html_attributes[:bv_greaterthan] = 'true'
          @html_attributes[:bv_greaterthan_inclusive] = 'false' 
          @html_attributes[:bv_greaterthan_value] = options[:greater_than] 

          @js_options["greaterThan"] = {}
          @js_options["greaterThan"]["inclusive"] = false
          @js_options["greaterThan"]["value"] = options[:greater_than]
        end

        if options[:greater_than_or_equal_to].present?
          @html_attributes[:bv_greaterthan] = 'true'
          @html_attributes[:bv_greaterthan_inclusive] = 'true' 
          @html_attributes[:bv_greaterthan_value] = options[:greater_than] 

          @js_options["greaterThan"] = {}
          @js_options["greaterThan"]["inclusive"] = true
          @js_options["greaterThan"]["value"] = options[:greater_than]
        end

        if options[:less_than].present?
          @html_attributes[:bv_lessthan] = 'true'
          @html_attributes[:bv_lessthan_inclusive] = 'false' 
          @html_attributes[:bv_lessthan_value] = options[:greater_than] 

          @js_options["lessThan"] = {}
          @js_options["lessThan"]["inclusive"] = false
          @js_options["lessThan"]["value"] = options[:greater_than]
        end

        if options[:less_than_or_equal_to].present?
          @html_attributes[:bv_lessthan] = 'true'
          @html_attributes[:bv_lessthan_inclusive] = 'true' 
          @html_attributes[:bv_lessthan_value] = options[:greater_than] 

          @js_options["lessThan"] = {}
          @js_options["lessThan"]["inclusive"] = true
          @js_options["lessThan"]["value"] = options[:greater_than]
        end

        if options[:odd].present?
          @js_options["step"] = {} 
          @js_options["step"]["message"] = 'should be odd'
          @js_options["step"]["base"] = 1 
          @js_options["step"]["step"] = 2

          @html_attributes[:bv_step] = 'true'
          @html_attributes[:bv_step_message] = 'should be odd'
          @html_attributes[:bv_step_base] = 1 
          @html_attributes[:bv_step_step] = 2 
        end

        if options[:even].present?
          @js_options["step"] = {} 
          @js_options["step"]["message"] = 'should be even'
          @js_options["step"]["base"] = 0 
          @js_options["step"]["step"] = 2

          @html_attributes[:bv_step] = 'true'
          @html_attributes[:bv_step_message] = 'should be even'
          @html_attributes[:bv_step_base] = 0 
          @html_attributes[:bv_step_step] = 2 
        end
      end

    end
  end
end
