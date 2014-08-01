module BootstrapValidatorRails
  module Validators
    class Validator
      def initialize(record, method, validator)
        @record, @method, @validator = record, method, validator
        @js_options = {}
        @html_attributes = {}
        generate_options!
      end

      def validator_options
        options = @validator.try(:options) 
        options || {}
      end

      def generate_object(options = {})
        options
      end

      def unsupported?
        options = validator_options

        on_options_map = {
          :create => :new_record?,
          :update => :persisted?
        }

        if on_options_map.has_key?(options[:on])
          return true unless @record.send(on_options_map[options[:on]])
        end

        unsupported_options.any? { |opt| options.has_key? opt }
      end

      def html_attributes
        @html_attributes
      end

      def js_options
        {method_key => {'validators' => @js_options}}
      end

      def generate_message
        validator_options[:message] || i18n_message
      end

      def generate_options!
        {}
      end

      protected
      def unsupported_options
        BootstrapValidatorRails::CONFIGURATION[:unsupported_options]
      end

      def method_key
        "#{@record.class.to_s.underscore.to_sym}[#{@method}]"
      end

      def i18n_message
        @record.errors.generate_message(@method, @validator.kind, default: '')
      end
    end
  end
end
