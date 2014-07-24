bootstrap_validator_rails
=========================

Bootstrap Validator Plugin for Rails: https://github.com/nghuuphuoc/bootstrapvalidator
And I use Bootstrap Form as the form builder. https://github.com/bootstrap-ruby

##Installation
```
gem install bootstrap_validator_rails
```
or add this to your Gemfile
```
gem 'bootstrap_validator_rails'
```

Then add this to your `application.js`
```javascript
//= require bootstrapValidator
```

and your `application.css`

```css
*= require bootstrapValidator
```
Run `bundle install`

##Usage

In you model

```ruby
class Product
  validates :name, presence: true
  validates :price, numericality: {greater_than: 20}
end
```

In your form

```haml
= bootstrap_validation_form_for(@user) do |f|
  = f.text_field :name
  = f.text_field :price
```

Generated HTML

```html
<input id='product_name' name='product[name]' data-bv-notempty='' data-bv-notempty-message='cannot be blank'/> 
<input id='product_price' name='product[price]' data-bv-greaterthan-inclusive='false' data-bv-greaterthan-value='20' />
```

Currenty support for `text_field`

List of validators supported
```
presence
numericality(greater_than, greater_than_or_equal_to, less_than, less_than_or_equal_to)
```

