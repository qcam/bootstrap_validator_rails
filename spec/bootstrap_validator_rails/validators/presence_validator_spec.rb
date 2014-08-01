require 'rails_helper'

describe BootstrapValidatorRails::Validators::Presence do
  class PresenceProduct
    include ActiveModel::Validations

    attr_accessor :title

    validates :title, presence: {message: "Hey guy, fill in please!"}
    validates :price, presence: {on: :create}
  end
  
  let(:post) { PresenceProduct.new }
  let(:method) { :title }
  let(:validator) { PresenceProduct.validators_on(method).first }
  let(:bootstrap_validator) { described_class.new(post, method, validator) }
  
  describe '#generate_data' do
    it 'generates data options' do
      html_attributes = bootstrap_validator.html_attributes
      expect(html_attributes).to have_key :bv_notempty
      expect(html_attributes).to have_key :bv_notempty_message
    end
  end

  describe '#generate_object' do
    it 'generates object for javascript' do
      js_options = bootstrap_validator.js_options
      expect(js_options).to eq(
        {
          'presence_product[title]' => {
            'validators' => {
              'notEmpty' => {
                'message' => "Hey guy, fill in please!"
              }
            }
          } 
        }
      )
    end

    it 'kjdsafljalksf' do
      js_options = bootstrap_validator.js_options
    end
  end
end
