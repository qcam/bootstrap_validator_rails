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

In your form

```haml
= bootstrap_validation_form_for(@user) do |f|
  = f.text_field :name
```

Generated HTML

```html
<input id='name' name='user[name]' data-mv-notempty='' data-mv-notempty-message='cannot be blank' />
```

Currenty support for `text_field`

List of validation supported
```
presence
numericality
```

