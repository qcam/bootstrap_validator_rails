module BootstrapValidatorRails
  module Validators
    class Attributes
      def initialize(record)
        @record = record
      end

      def validator_data(method)
        validators = validators_on(method)

        validators.inject({}) do |attributes, validator|
          @generator = BootstrapValidatorRails::Validators::Generator.new(@record, validator.kind, method)
          attributes.merge @generator.generate_data
        end
      end

      def validators_on(method)
        @record.class.validators_on(method)
      end
      
      def validator_message_of(method, kind)
        message = @record.errors.generate_message(method, kind, default: "is invalid")
        {VALIDATORS[kind][:message] => message} 
      end
      
      def validator_key_of(validator)
        {VALIDATORS[validator.kind][:key] => ''}
      end
    end
  end
end
