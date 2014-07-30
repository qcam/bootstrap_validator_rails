require 'rails_helper'

describe ActionView::Base do
  class HelperProduct
    include ActiveModel::Validations

    attr_accessor :title

    validates :title, presence: true
  end
  
  let(:product) { HelperProduct.new }
  let(:view) { described_class.new }

  describe '#bv_options_for' do
    it 'generates json options' do
      bv_options = view.bv_options_for(product)
      expect(bv_options).to eq(
        {
          fields: {
            'helperproduct[title]' => {
              'validators' => {
                'notEmpty' => {
                  'message' => "can't be blank"
                }
              }
            }
          }
        }.to_json.html_safe
      )
    end
  end

  describe '#bootstrap_validation_form_for' do
    it 'generates form tag using #bootstrap_form_for' do
      expect(view).to receive(:bootstrap_form_for).with(product, {builder: BootstrapValidatorRails::FormBuilder})
      view.bootstrap_validation_form_for(product)
    end
  end
end
