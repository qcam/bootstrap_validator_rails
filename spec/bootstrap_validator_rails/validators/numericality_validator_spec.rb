require 'rails_helper'

describe BootstrapValidatorRails::Validators::Numericality do
  class NumericalityProduct 
    include ActiveModel::Validations

    attr_accessor :price

    validates :price, numericality: {only_integer: true, greater_than: 10, even: true}
  end

  let(:product) { NumericalityProduct.new }
  let(:method) { :price }
  let(:validator) { NumericalityProduct.validators_on(method).first }
  let(:bootstrap_validator) { described_class.new(product, method, validator) }

  describe '#generate_data' do
    it 'generates html data tag' do
      html_attributes = bootstrap_validator.html_attributes
      expect(html_attributes).to have_key :bv_numeric
      expect(html_attributes).to have_key :bv_greaterthan
      expect(html_attributes).to have_key :bv_greaterthan_inclusive
      expect(html_attributes).to have_key :bv_greaterthan_value
      expect(html_attributes).to have_key :bv_step
      expect(html_attributes).to have_key :bv_step_base
      expect(html_attributes[:bv_greaterthan_value]).to eq 10
    end
  end

  describe '#generate_object' do
    it 'generates html data tag' do
      js_options = bootstrap_validator.js_options['numericality_product[price]']['validators']

      expect(js_options).to have_key 'integer'

      expect(js_options['integer']).to eq({
        'message' => 'should be a number'
      })

      expect(js_options).to have_key 'greaterThan'

      expect(js_options['greaterThan']).to eq({
        'inclusive' => false,
        'value' => 10
      })
      
      expect(js_options).to have_key 'step'

      expect(js_options['step']).to eq({
        'message' => 'should be even',
        'base' => 0,
        'step' => 2
      })
    end
  end
end
