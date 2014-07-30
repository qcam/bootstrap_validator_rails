module BootstrapValidatorRails
  module Validators
    class Generator
      def initialize(record, validator, method)
        @record, @validator, @method = record, validator, method
        @kind = validator.kind
      end

      def generate_js_options
        return {} unless VALIDATOR_SUPPORTED.include?(@kind)
        klass = "BootstrapValidatorRails::Validators::#{@kind.to_s.capitalize}".constantize
        bootstrap_validator = klass.new(@record, @method, @validator)
        bootstrap_validator.js_options
      end
    end
  end
end
