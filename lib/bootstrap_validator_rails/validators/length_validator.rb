module BootstrapValidatorRails
  module Validators
    class Length < Validator
      def generate_data
        data = {}
        return data if unsupported?
        
        options = validator_options

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

      def generate_json
        {}
      end
    end
  end
end
