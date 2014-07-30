require 'rails_helper'

class Product
  include ActiveModel::Validations

  attr_accessor :title

  validates :title, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end

describe BootstrapValidatorRails::Validators::Format do
  let(:product) { Product.new }
  let(:method) { :title }
  let(:validator) { Product.validators_on(method).first }
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
          'product[title]' => {
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
