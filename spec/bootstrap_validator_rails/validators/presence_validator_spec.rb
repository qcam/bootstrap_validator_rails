require 'rails_helper'

class Product
  include ActiveModel::Validations

  attr_accessor :title

  validates :title, presence: true
end

describe BootstrapValidatorRails::Validators::Presence do
  let(:post) { Product.new }
  let(:method) { :title }
  let(:validator) { Product.validators_on(method) }
  let(:bootstrap_validator) { described_class.new(post, method, validator) }
  
  describe '#generate_data' do
    it 'generates data options' do
      generated_data = bootstrap_validator.generate_data
      expect(generated_data).to have_key :bv_notempty
      expect(generated_data).to have_key :bv_notempty_message
    end
  end

  describe '#generate_object' do
    it 'generates object for javascript' do
      generate_object = bootstrap_validator.generate_object
      expect(generate_object).to eq(
        {
          'product[title]' => {
            'validators' => {
              'notEmpty' => {
                'message' => "can't be blank"
              }
            }
          } 
        }
      )
    end
  end
end
