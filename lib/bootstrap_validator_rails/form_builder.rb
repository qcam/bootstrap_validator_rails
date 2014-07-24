require 'bootstrap_form'

module BootstrapValidatorRails
  class FormBuilder < BootstrapForm::FormBuilder
    def initialize(object_name, object, template, options)
      @validator_messages = ValidatorMessage.new(object)
      super
    end

    def text_field(method, options = {})
      attribute = @validator_messages.attributes_of(method)
      
      options[:data] = {}
      options[:data] = options[:data].merge(attribute)
      super
    end
  end
end
