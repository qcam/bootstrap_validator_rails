module BootstrapValidatorRails
  module Validators
    class Presence < Validator
      def generate_message
        @record.errors.generate_message(@method, :blank, default: "can't be blank")
      end

      def generate_options!(options = {})
        return if unsupported?

        @js_options['notEmpty'] = {} 
        @html_attributes[:bv_notempty] = 'true'

        @js_options['notEmpty']['message'] = generate_message
        @html_attributes[:bv_notempty_message] = generate_message 
      end
    end
  end
end
