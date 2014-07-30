require 'rails_helper'

describe BootstrapValidatorRails::Validators::Format do
  class FormatProduct
    include ActiveModel::Validations

    attr_accessor :title

    validates :title, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  end

  let(:product) { FormatProduct.new }
  let(:method) { :title }
  let(:validator) { FormatProduct.validators_on(method).first }
  let(:bootstrap_validator) { described_class.new(product, method, validator) }

  describe '#generate_data' do
    it 'generates html data tag' do
      html_attributes = bootstrap_validator.html_attributes
      expect(html_attributes).to have_key :bv_regexp
      expect(html_attributes).to have_key :bv_regexp_regexp
      expect(html_attributes).to have_key :bv_regexp_message
    end
  end

  describe '#generate_object' do
    it 'generates options object' do
      js_options = bootstrap_validator.js_options
      expect(js_options).to eq (
        {
          'format_product[title]' => {
            'validators' => {
              'regexp' => {
                'regexp' => '^[a-zA-Z]+$',
                'message' => 'only allows letters'
              }
            }
          }
        }
      )
    end
  end
end
