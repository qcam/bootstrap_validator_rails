class Regexp
  def to_javascript
    Regexp.new(inspect.sub('\\A','^').sub('\\Z','$').sub('\\z','$').sub(/^\//,'').sub(/\/[a-z]*$/,'').gsub(/\(\?#.+\)/, '').gsub(/\(\?-\w+:/,'('), self.options).inspect
  end
end

module BootstrapValidatorRails
  module Validators
    class Format < Validator

      def generate_options!
        return if unsupported?
        
        options = validator_options

        regex = options[:with].to_javascript
        regex.sub!('/^', '^')
        regex.sub!('$/', '$')
        
        @js_options['regexp'] = {}
        @html_attributes[:bv_regexp] = 'true'

        if options[:with]
          @js_options['regexp']['regexp'] = regex
          @html_attributes[:bv_regexp_regexp] = regex 
        end

        if options[:message]
          @js_options['regexp']['message'] = generate_message
          @html_attributes[:bv_regexp_message] = generate_message
        end
      end
    end
  end
end
