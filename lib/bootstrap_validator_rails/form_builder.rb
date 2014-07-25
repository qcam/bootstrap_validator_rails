require 'bootstrap_form'

module BootstrapValidatorRails
  class FormBuilder < BootstrapForm::FormBuilder
    def initialize(object_name, object, template, options)
      @attributes = BootstrapValidatorRails::Validators::Attributes.new(object)
      super
    end

    FIELD_HELPERS.each do |method_name|
      define_method(method_name) do |method, options = {}|
        attribute = @attributes.validator_data(method)
        options[:data] ||= {}
        options[:data] = options[:data].merge(attribute)
        super(method, options)
      end
    end
  end
end
