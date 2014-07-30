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
      generated_data = bootstrap_validator.generate_data
      expect(generated_data).to have_key :bv_numeric
      expect(generated_data).to have_key :bv_greaterthan
      expect(generated_data).to have_key :bv_greaterthan_inclusive
      expect(generated_data).to have_key :bv_greaterthan_value
      expect(generated_data).to have_key :bv_step
      expect(generated_data).to have_key :bv_step_base
      expect(generated_data[:bv_greaterthan_value]).to eq 10
    end
  end

  describe '#generate_object' do
    it 'generates html data tag' do
      generated_object = bootstrap_validator.generate_object['numericality_product[price]']['validators']

      expect(generated_object).to have_key 'integer'

      expect(generated_object['integer']).to eq({
        'message' => 'should be a number'
      })

      expect(generated_object).to have_key 'greaterThan'

      expect(generated_object['greaterThan']).to eq({
        'inclusive' => false,
        'value' => 10
      })
      
      expect(generated_object).to have_key 'step'

      expect(generated_object['step']).to eq({
        'message' => 'should be even',
        'base' => 0,
        'step' => 2
      })
    end
  end
end
