require 'rails_helper'

describe BootstrapValidatorRails::Validators::Validator do
  class ValidatorProduct
    include ActiveModel::Validations
    include ActiveRecord::Persistence

    attr_accessor :price, :title

    validates :price, presence: {on: :create} 
    validates :title, presence: {on: :update} 
  end

  let(:product) { ValidatorProduct.new }
  let(:validator) { ValidatorProduct.validators_on(method).first }
  let(:bootstrap_validator) { described_class.new(product, method, validator) }

  describe '#unsupported?' do
    let(:method) { :price }

    context 'when record is a new record' do
      before { allow(product).to receive(:new_record?).and_return(true) }

      it 'supports this validator' do
        expect(bootstrap_validator).to_not be_unsupported
      end
    end

    context 'when record is not a new record' do
      before { allow(product).to receive(:new_record?).and_return(false) }

      it 'should not support this validator' do
        expect(bootstrap_validator).to be_unsupported
      end
    end

    context 'when record is persisted' do
      let(:method) { :title }

      before { allow(product).to receive(:persisted?).and_return(true) }

      it 'supports this validator' do
        expect(bootstrap_validator).to_not be_unsupported
      end
    end
  end
end
