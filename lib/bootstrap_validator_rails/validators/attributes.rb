module BootstrapValidatorRails
  module Validators
    class Attributes
      def initialize(record)
        @record = record
      end

      def validator_data(method)
        validators = validators_on(method)

        validators.inject({}) do |attributes, validator|
          @generator = BootstrapValidatorRails::Validators::Generator.new(@record, validator, method)
          attributes.merge @generator.generate_data
        end
      end

      def validators_on(method)
        @record.class.validators_on(method)
      end
    end
  end
end
