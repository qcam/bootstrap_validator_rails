require 'rails_helper'

describe BootstrapValidatorRails::Validators::Acceptance do
  let(:bootstrap_validator) { described_class.new(nil, nil, nil) }

  it 'should be a instance of Presence Validator' do
    expect(bootstrap_validator).to be_a BootstrapValidatorRails::Validators::Presence
  end
end
