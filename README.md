Bootstrap Validator Rails
=========================

Rails client side validation using BootstrapValidator Plugin: https://github.com/nghuuphuoc/bootstrapvalidator
Bootstrap Form as the form builder. https://github.com/bootstrap-ruby/rails-bootstrap-form

## Installation

```sh
gem install bootstrap_validator_rails
```

or add this to your Gemfile

```ruby
gem 'bootstrap_validator_rails', '~> 1.1.0'
```

then run 

```sh
bundle install
```

## Usage

Add this to your `application.js`

```javascript
//= require bootstrapValidator
//or
//= require bootstrapValidator.min
```

and your `application.css`

```css
/*= require bootstrapValidator */
/* or */
/*= require bootstrapValidator.min */
```

In you model

```ruby
class Product
  validates :name, presence: true
  validates :price, numericality: {greater_than: 20}
  validates :intro, length: {in: 50..200}
  validates :terms_of_service, acceptance: {on: :create} # only validates if new_record?
  validates :sku, format: {with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
  # Thank Brian Cardarella for this: http://reefpoints.dockyard.com/ruby/2011/11/18/convert-ruby-regexp-to-javascript-regex.html
end
```

In your form

```haml
= bv_form_for(@product) do |f|
  = f.text_field :name
  = f.text_field :price
```
Please make sure to add the script
```javascript
$(document).ready(function() {
  $('#your_form').bootstrapValidator();
});
```

Generated HTML

```html
<input id='product_name' name='product[name]' data-bv-notempty='' data-bv-notempty-message='cannot be blank'/> 
<input id='product_price' name='product[price]' data-bv-greaterthan-inclusive='false' data-bv-greaterthan-value='20' />
```

#### ActiveRecord Message

```yml
activerecord:
  errors:
    models:
      post:
        attributes:
          title:
            blank: is required
```

Please see: http://guides.rubyonrails.org/i18n.html#error-message-scopes

## List of helpers supported

* color_field 
* date_field  
* datetime_field
* datetime_local_field
* email_field 
* month_field 
* number_field 
* password_field 
* phone_field
* range_field 
* search_field 
* telephone_field 
* text_area 
* text_field 
* time_field
* week_field
* check_box

Please refer to Bootstrap Form: https://github.com/bootstrap-ruby/rails-bootstrap-forms

## List of validators supported
* presence
* numericality
  * only_integer 
  * greater_than
  * greater_than_or_equal_to 
  * less_than 
  * less_than_or_equal_to
  * odd
  * even
* length
  * is
  * within
  * in
  * minimum
  * maxiumum
* format
  * with: regular expression
* acceptance
* in progress ...

## Using Simple Form, Formtastic, Rails Form?

Add this to your `application.js`

```coffeescript
//= require bootstrapValidatorRails
```

And in your HAML/ERB

```haml
.my-awesome-form= simple_form_for @post do |f|
  = f.input :title

= bv_javascript_for @post
```

Actually `bv_javascript_for` generates script like this

```javascript
//<![CDATA[
  $(document).ready(function() {
    bv_form('.bv_form', {"fields":{"post[title]":{"validators":{"notEmpty":{"message":"can't be blank"},"regexp":{"regexp":"^[a-zA-Z]+$","message":"only allows letters"}}},"post[price]":{"validators":{"step":{"message":"should be odd","base":1,"step":2}}},"post[accepted]":{"validators":{"notEmpty":{"message":"should be accepted"}}}}})
  });
//]]>
```

So make sure that you have added **bv_form** to your form classes

```html
= simple_form_for @post, html: {class: 'bv_form'} do |f|
  = f.input :title
```

#### Please note that as BootstrapValidator jQuery plugin is based on Bootstrap so make sure that your form markup is following Bootstrap Form

```html
<div class="form-group">
  <div class="checkbox">
    <label>
      <input type="checkbox" id="terms">
      Check yourself
    </label>
  </div>
</div>
```

