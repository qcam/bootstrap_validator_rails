require 'rails_helper'

describe BootstrapValidatorRails::Validators::Length do
  class LengthProduct
    include ActiveModel::Validations

    attr_accessor :title

    validates :title, length: {in: 5..10}
  end
 
  let(:product) { LengthProduct.new }
  let(:validator) { LengthProduct.validators_on(:title).first }
  let(:bootstrap_validator) { described_class.new(product, :title, validator) }

  describe '#generate_data' do
    it 'generates html data tag' do
      html_attributes = bootstrap_validator.html_attributes
      expect(html_attributes).to have_key :bv_stringlength
      expect(html_attributes).to have_key :bv_stringlength_min
      expect(html_attributes).to have_key :bv_stringlength_max
      expect(html_attributes[:bv_stringlength_min]).to eq 5
      expect(html_attributes[:bv_stringlength_max]).to eq 10
    end
  end

  describe '#generate_object' do
    it 'generates object' do
      js_options = bootstrap_validator.js_options
      expect(js_options).to eq(
        {
          'length_product[title]' => {
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
