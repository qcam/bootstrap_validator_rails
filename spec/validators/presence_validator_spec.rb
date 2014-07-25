require 'rails_helper'

describe BootstrapValidatorRails::Validators::Presence do
  let(:post) { Post.new }
  let(:method) { :title }
  let(:validator) { Post.validators_on(method) }
  let(:bootstrap_validator) { described_class.new(post, method, validator) }
  
  describe '#generate_data' do
    it 'generates data options' do
      generated_data = bootstrap_validator.generate_data
      expect(generated_data).to have_key :bv_notempty
      expect(generated_data).to have_key :bv_notempty_message
    end
  end
end
