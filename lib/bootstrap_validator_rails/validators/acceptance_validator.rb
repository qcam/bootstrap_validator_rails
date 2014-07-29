module BootstrapValidatorRails
  module Validators
    class Acceptance < Presence
      def generate_message
        'should be accepted'
      end
    end
  end
end
