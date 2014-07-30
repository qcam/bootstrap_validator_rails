module BootstrapValidatorRails
  module Validators
    class Validator
      def initialize(record, method, validator)
        @record, @method, @validator = record, method, validator
      end

      def validator_options
        options = @validator.try(:options) 
        options || {}
      end

      def generate_object(options = {})
        options
      end

      def unsupported?
        options = validator_options
        unsupported_options.any? { |opt| options.has_key? opt }
      end

      protected
      def unsupported_options
        BootstrapValidatorRails::CONFIGURATION[:unsupported_options]
      end

      def method_key
        "#{@record.class.to_s.underscore.to_sym}[#{@method}]"
      end
    end
  end
end
