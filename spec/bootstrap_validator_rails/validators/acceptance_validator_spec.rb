require 'rails_helper'

describe BootstrapValidatorRails::Validators::Acceptance do
  class AcceptanceProduct
    include ActiveModel::Validations

    attr_accessor :terms_and_conditions

    validates :terms_and_conditions, acceptance: {message: 'Accept our T&C please'}
  end

  let(:product) { AcceptanceProduct.new }
  let(:validator) { AcceptanceProduct.validators_on(:terms_and_conditions).first }
  let(:bootstrap_validator) { described_class.new(product, :terms_and_conditions, validator) }

  it 'should be a instance of Presence Validator' do
    expect(bootstrap_validator).to be_a BootstrapValidatorRails::Validators::Presence
    html_attributes = bootstrap_validator.html_attributes
    expect(html_attributes[:bv_notempty_message]).to eq 'Accept our T&C please'
  end
end
