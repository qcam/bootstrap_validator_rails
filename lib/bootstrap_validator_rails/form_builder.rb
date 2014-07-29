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

    def check_box(method, options = {}, checked_value = "1", unchecked_value = "0", &block)
      options[:data] ||= {}
      attribute = @attributes.validator_data(method)
      options[:data] = options[:data].merge(attribute)
      options[:include_hidden] = false
      content_tag :div, super, class: 'form-group'
    end
  end
end
