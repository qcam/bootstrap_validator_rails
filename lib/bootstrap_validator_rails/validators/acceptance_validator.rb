module BootstrapValidatorRails
  module Validators
    class Acceptance < Presence
      def i18n_message
        @record.errors.generate_message(@method, :accepted, default: '')
      end
    end
  end
end
