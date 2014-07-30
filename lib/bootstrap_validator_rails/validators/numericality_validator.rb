module BootstrapValidatorRails
  module Validators
    class Numericality < Validator
      def generate_message
        @record.errors.generate_message(@method, :presence, {default: 'should be a number'})
      end

      def generate_options!
        return if unsupported?

        options = @validator.options

        generate_numeric_options!
        generate_integer_options!
        generate_greater_than_options!
        generate_less_than_options!
        generate_parity_options!
      end

      private
      def generate_numeric_options!
        @html_attributes[:bv_numeric] = 'true'
        @html_attributes[:bv_numeric_separator] = '.'

        @js_options['numeric'] = {}
        @js_options['numeric']['separator'] = ','
      end

      def generate_integer_options!
        options = validator_options

        if options[:only_integer].present?
          @html_attributes[:bv_integer] = 'true'
          @html_attributes[:bv_integer_message] = generate_message
          @js_options['integer'] = {}
          @js_options['integer']['message'] = generate_message
        end
      end

      def generate_greater_than_options!
        options = validator_options

        return if options[:greater_than].nil? && options[:greater_than_or_equal_to].nil?

        inclusive = options[:greater_than_or_equal_to].present?
        value = options[:greater_than] || options[:greater_than_or_equal_to]

        @html_attributes[:bv_greaterthan] = 'true'
        @js_options["greaterThan"] = {}

        @html_attributes[:bv_greaterthan_value] = value
        @js_options["greaterThan"]["value"] = value
        
        @html_attributes[:bv_greaterthan_inclusive] = inclusive.to_s
        @js_options["greaterThan"]["inclusive"] = inclusive
      end

      def generate_less_than_options!
        options = validator_options

        return if options[:less_than].nil? && options[:less_than_or_equal_to].nil?

        inclusive = options[:less_than_or_equal_to].present?
        value = options[:less_than] || options[:less_than_or_equal_to]

        @html_attributes[:bv_lessthan] = 'true'
        @js_options["lessThan"] = {}

        @html_attributes[:bv_lessthan_value] = value
        @js_options["lessThan"]["value"] = value
        
        @html_attributes[:bv_lessthan_inclusive] = inclusive.to_s
        @js_options["lessThan"]["inclusive"] = inclusive
      end

      def generate_parity_options!
        options = validator_options

        return if options[:odd].nil? && options[:even].nil?

        base = options[:odd].present? ? 1 : 0
        message = options[:odd].present? ? 'should be odd' : 'should be even'

        @js_options["step"] = {} 
        @js_options["step"]["message"] = message
        @js_options["step"]["base"] = base
        @js_options["step"]["step"] = 2

        @html_attributes[:bv_step] = 'true'
        @html_attributes[:bv_step_message] = message
        @html_attributes[:bv_step_base] = base
        @html_attributes[:bv_step_step] = 2 
      end

    end
  end
end
