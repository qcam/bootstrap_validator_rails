require 'rails_helper'

describe BootstrapValidatorRails::Validators::Attributes do
  class AttributesProduct
    include ActiveModel::Validations

    attr_accessor :title

    validates :title, presence: true
  end

  describe 'validator_data' do
    let(:post) { AttributesProduct.new }
    let(:attributes) { described_class.new post }

    it 'calls generator to generate html attributes' do
      validator_data = attributes.validator_data :title
    end
  end
end
