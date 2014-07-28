module BootstrapValidatorRails
  module Validators
    class Length
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

        data[:bv_stringlength] = 'true'

        if options[:minimum]
          data[:bv_stringlength_min] = options[:minimum] 
        end

        if options[:maximum]
          data[:bv_stringlength_max] = options[:maximum] 
        end

        if options[:is]
          data[:bv_stringlength_minimum] = options[:is] 
          data[:bv_stringlength_maximum] = options[:is] 
          data[:bv_stringlength_message] = @record.errors.generate_message(@method) 
        end

        data
      end
    end
  end
end
