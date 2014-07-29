require 'rails_helper'

describe BootstrapValidatorRails::Helper, type: :helper do
  let(:post) { Post.new }

  it 'generates json options' do
    object = helper.bv_options_for(post)
    expect(object).to be_a String
  end
end
