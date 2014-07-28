module BootstrapValidatorRails
  module Validators
    class Numericality 
      def initialize(record, method, validator)
        @record, @method, @validator = record, method, validator
      end

      def generate_data
        data = {}

        options = @validator.try(:options) 

        if options.present?
          BootstrapValidatorRails::CONFIGURATION[:unsupported_options].each do |opt|
            return data if options.has_key? opt
          end
        end

        data[:bv_numeric] = 'true'
        data[:bv_numeric_separator] = '.'
        
        data.merge(generate_options)
      end

      def generate_message
        @record.errors.generate_message(@method, :presence, {default: 'should be a number'})
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
        data
      end
    end
  end
end
