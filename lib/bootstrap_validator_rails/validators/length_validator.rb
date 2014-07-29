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

      def generate_object
        options = @validator.options

        data = {}

        data["stringLength"] = {}

        if options[:minimum]
          data["stringLength"]["min"] = options[:minimum]
        end

        if options[:maximum]
          data["stringLength"]["max"] = options[:maximum] 
        end

        if options[:is]
          data["stringLength"]["min"] = options[:is] 
          data["stringLength"]["max"] = options[:is] 
          data["stringLength"]['message'] = @record.errors.generate_message(@method) 
        end

        {method_key => {validators: data}}
      end
    end
  end
end
