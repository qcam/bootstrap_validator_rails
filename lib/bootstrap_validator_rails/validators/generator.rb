module BootstrapValidatorRails
  module Validators
    class Generator
      def initialize(record, kind, method)
        @record = record
        klass = "BootstrapValidatorRails::Validators::#{kind.to_s.capitalize}".constantize
        @validator_message = klass.new(record, method)
        @method = method
      end

      def generate_data
        @validator_message.generate_data
      end
    end
  end
end
