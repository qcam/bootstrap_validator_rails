module BootstrapValidatorRails
  module Validators
    class Presence
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

        data[:bv_notempty] = 'true'
        data[:bv_notempty_message] = generate_message
        data
      end

      def generate_message
        @record.errors.generate_message(@method, :blank, default: "can't be blank")
      end
    end
  end
end
