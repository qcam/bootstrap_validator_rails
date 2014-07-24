require 'bootstrap_form'

module BootstrapValidatorRails
  class FormBuilder < BootstrapForm::FormBuilder
    def initialize(object_name, object, template, options)
      @attributes = BootstrapValidatorRails::Validators::Attributes.new(object)
      super
    end

    def text_field(method, options = {})
      attribute = @attributes.validator_data(method)
      
      options[:data] ||= {}
      options[:data] = options[:data].merge(attribute)
      super
    end
  end
end
