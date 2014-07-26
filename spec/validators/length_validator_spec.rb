require 'rails_helper'

describe BootstrapValidatorRails::Validators::Length do
  let(:post) { Post.new }
  let(:method) { :title }
  let(:validator) { Post.validators_on(method).select { |validator| validator.kind == :length }.first }
  let(:bootstrap_validator) { described_class.new(post, method, validator) }

  describe '#generate_data' do
    it 'generates html data tag' do
      generated_data = bootstrap_validator.generate_data
      expect(generated_data).to have_key :bv_stringlength
      expect(generated_data).to have_key :bv_stringlength_min
      expect(generated_data).to have_key :bv_stringlength_max
      expect(generated_data[:bv_stringlength_min]).to eq 20
      expect(generated_data[:bv_stringlength_max]).to eq 50
    end
  end
end
