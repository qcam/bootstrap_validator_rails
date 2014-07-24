module BootstrapValidatorRails
  module Validators
    class Presence
      def initialize(record, method)
        @record, @method = record, method
      end

      def generate_data
        {
          :bv_notempty => '',
          :bv_notempty_message => generate_message
        }
      end

      def generate_message
        @record.errors.generate_message(@method, :presence, {default: 'cannot be blank'})
      end
    end
  end
end
