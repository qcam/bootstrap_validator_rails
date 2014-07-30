require 'rails_helper'

class Product
  include ActiveModel::Validations

  attr_accessor :title

  validates :title, length: {in: 5..10}
end

describe BootstrapValidatorRails::Validators::Length do
  let(:product) { Product.new }
  let(:validator) { Product.validators_on(:title).first }
  let(:bootstrap_validator) { described_class.new(product, :title, validator) }

  describe '#generate_data' do
    it 'generates html data tag' do
      generated_data = bootstrap_validator.generate_data
      expect(generated_data).to have_key :bv_stringlength
      expect(generated_data).to have_key :bv_stringlength_min
      expect(generated_data).to have_key :bv_stringlength_max
      expect(generated_data[:bv_stringlength_min]).to eq 5
      expect(generated_data[:bv_stringlength_max]).to eq 10
    end
  end

  describe '#generate_object' do
    it 'generates object' do
      generated_object = bootstrap_validator.generate_object
      expect(generated_object).to eq(
        {
          'product[title]' => {
            'validators' => {
              'stringLength' => {
                'min' => 5,
                'max' => 10
              }
            }
          }
        }
      )
    end
  end
end
