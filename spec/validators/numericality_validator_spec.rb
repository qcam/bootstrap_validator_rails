require 'rails_helper'

describe BootstrapValidatorRails::Validators::Numericality do
  let(:post) { Post.new }
  let(:method) { :title }
  let(:validator) { Post.validators_on(method).select { |validator| validator.kind == :numericality }.first }
  let(:bootstrap_validator) { described_class.new(post, method, validator) }

  describe '#generate_data' do
    it 'generates html data tag' do
      generated_data = bootstrap_validator.generate_data
      expect(generated_data).to have_key :bv_numeric
      expect(generated_data).to have_key :bv_greaterthan
      expect(generated_data).to have_key :bv_greaterthan_inclusive
      expect(generated_data).to have_key :bv_greaterthan_value
      expect(generated_data[:bv_greaterthan_value]).to eq 20
    end
  end
end
