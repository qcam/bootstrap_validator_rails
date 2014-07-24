module BootstrapValidatorRails
  module Validators
    class Generator
      VALIDATOR_SUPPORTED = [:presence, :numericality]

      def initialize(record, kind, method)
        @record, @kind, @method = record, kind, method
      end

      def generate_data
        return {} unless VALIDATOR_SUPPORTED.include?(@kind)
        klass = "BootstrapValidatorRails::Validators::#{@kind.to_s.capitalize}".constantize
        @validator = klass.new(@record, @method)
        @validator.generate_data
      end
    end
  end
end
