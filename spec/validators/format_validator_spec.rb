require 'rails_helper'

describe BootstrapValidatorRails::Validators::Format do
  let(:post) { Post.new }
  let(:method) { :title }
  let(:validator) { Post.validators_on(method).select { |validator| validator.kind == :format }.first }
  let(:bootstrap_validator) { described_class.new(post, method, validator) }

  describe '#generate_data' do
    it 'generates html data tag' do
      generated_data = bootstrap_validator.generate_data
      expect(generated_data).to have_key :bv_regexp
      expect(generated_data).to have_key :bv_regexp_regexp
      expect(generated_data).to have_key :bv_regexp_message
    end
  end
end
