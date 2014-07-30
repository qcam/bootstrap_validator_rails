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
      generated_data = bootstrap_validator.generate_data
      expect(generated_data).to have_key :bv_regexp
      expect(generated_data).to have_key :bv_regexp_regexp
      expect(generated_data).to have_key :bv_regexp_message
    end
  end

  describe '#generate_object' do
    it 'generates options object' do
      generated_object = bootstrap_validator.generate_object
      expect(generated_object).to eq (
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
