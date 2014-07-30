module BootstrapValidatorRails
  module Validators
    class Numericality < Validator
      def generate_data
        data = {}
        return data if unsupported?
        
        options = validator_options

        data[:bv_numeric] = 'true'
        data[:bv_numeric_separator] = '.'
        
        data.merge(generate_options)
      end

      def generate_message
        @record.errors.generate_message(@method, :presence, {default: 'should be a number'})
      end

      def generate_object
        options = @validator.options

        data = {}

        if options[:only_integer].present?
          data["integer"] = {}
          data["integer"]['message'] = 'should be a number'
        end

        if options[:greater_than].present?
          data["greaterThan"] = {}
          data["greaterThan"]["inclusive"] = false
          data["greaterThan"]["value"] = options[:greater_than]
        end

        if options[:greater_than_or_equal_to].present?
          data["greaterThan"] = {}
          data["greaterThan"]["inclusive"] = true
          data["greaterThan"]["value"] = options[:greater_than_or_equal_to]
        end

        if options[:less_than].present?
          data["lessThan"] = {}
          data["lessThan"]["inclusive"] = false
          data["lessThan"]["value"] = options[:less_than]
        end

        if options[:less_than_or_equal_to].present?
          data["lessThan"] = {}
          data["lessThan"]["inclusive"] = true
          data["lessThan"]["value"] = options[:less_than_or_equal_to]
        end

        if options[:odd].present?
          data["step"] = {} 
          data["step"]["message"] = 'should be odd'
          data["step"]["base"] = 1 
          data["step"]["step"] = 2
        end

        if options[:even].present?
          data["step"] = {} 
          data["step"]["message"] = 'should be even'
          data["step"]["base"] = 0 
          data["step"]["step"] = 2
        end

        {method_key => {'validators' => data}}
      end

      def generate_options
        options = @validator.options

        data = {}

        if options[:only_integer].present?
          data[:bv_integer] = 'true'
        end

        if options[:greater_than].present?
          data[:bv_greaterthan] = 'true'
          data[:bv_greaterthan_inclusive] = 'false'
          data[:bv_greaterthan_value] = options[:greater_than]
        end

        if options[:greater_than_or_equal_to].present?
          data[:bv_greaterthan] = 'true'
          data[:bv_greaterthan_inclusive] = 'true'
          data[:bv_greaterthan_value] = options[:greater_than_or_equal_to]
        end

        if options[:less_than].present?
          data[:bv_lessthan] = 'true'
          data[:bv_lessthan_inclusive] = 'false'
          data[:bv_lessthan_value] = options[:less_than]
        end

        if options[:less_than_or_equal_to].present?
          data[:bv_lessthan] = 'true'
          data[:bv_lessthan_inclusive] = 'true'
          data[:bv_lessthan_value] = options[:less_than_or_equal_to]
        end

        if options[:odd].present?
          data[:bv_step] = 'true'
          data[:bv_step_message] = 'should be odd'
          data[:bv_step_base] = '1'
          data[:bv_step_step] = '2'
        end

        if options[:even].present?
          data[:bv_step] = 'true'
          data[:bv_step_message] = 'should be even'
          data[:bv_step_base] = '0'
          data[:bv_step_step] = '2'
        end
        data
      end
    end
  end
end
