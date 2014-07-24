module BootstrapValidatorRails
  module Validators
    class Numericality 
      def initialize(record, method)
        @record, @method = record, method
      end

      def generate_data
        {
          :bv_numeric_separator => '',
          :bv_numeric_separator_message => generate_message
        }
      end

      def generate_message
        @record.errors.generate_message(@method, :presence, {default: 'should be a number'})
      end
    end
  end
end
