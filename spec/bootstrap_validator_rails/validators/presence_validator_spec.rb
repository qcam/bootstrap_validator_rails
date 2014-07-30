require 'rails_helper'

describe BootstrapValidatorRails::Validators::Presence do
  class PresenceProduct
    include ActiveModel::Validations

    attr_accessor :title

    validates :title, presence: true
  end
  
  let(:post) { PresenceProduct.new }
  let(:method) { :title }
  let(:validator) { PresenceProduct.validators_on(method) }
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
                'message' => "can't be blank"
              }
            }
          } 
        }
      )
    end
  end
end
