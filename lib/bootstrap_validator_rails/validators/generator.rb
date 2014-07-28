module BootstrapValidatorRails
  module Validators
    class Generator
      VALIDATOR_SUPPORTED = [:presence, :numericality, :length, :format]

      def initialize(record, validator, method)
        @record, @validator, @method = record, validator, method
        @kind = validator.kind
      end

      def generate_data(options = {})
        return {} unless VALIDATOR_SUPPORTED.include?(@kind)
        klass = "BootstrapValidatorRails::Validators::#{@kind.to_s.capitalize}".constantize
        bootstrap_validator = klass.new(@record, @method, @validator)
        bootstrap_validator.generate_data
      end
    end
  end
end
