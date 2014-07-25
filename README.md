Bootstrap Validator Rails
=========================

Bootstrap Validator Plugin for Rails: https://github.com/nghuuphuoc/bootstrapvalidator

Bootstrap Form as the form builder. https://github.com/bootstrap-ruby/rails-bootstrap-form

##Installation
```sh
gem install bootstrap_validator_rails
```

or add this to your Gemfile

```ruby
gem 'bootstrap_validator_rails', '~> 0.3.0'
```

then run 

```sh
bundle install
```

##Usage

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
end
```

In your form

```haml
= bootstrap_validation_form_for(@product) do |f|
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

Currenty support for `text_field`

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

Please refer to Bootstrap Form: https://github.com/bootstrap-ruby/rails-bootstrap-forms

## List of validators supported
* presence
* numericality
  * only_integer 
  * greater_than
  * greater_than_or_equal_to 
  * less_than 
  * less_than_or_equal_to
* length
  * is
  * within
  * in
  * minimum
  * maxiumum
```


