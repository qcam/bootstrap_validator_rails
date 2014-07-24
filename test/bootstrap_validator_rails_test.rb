require 'test_helper'

class BootstrapValidatorRailsTest < ActionView::TestCase
  def setup
    @post = Post.new(title: 'An awesome title')
    @form = view.bootstrap_validation_form_for(@post, url: '#') do |f|
      f.text_field :title
    end
  end

  test 'test will be included later' do
    p @form
  end
end
