class Regexp
  def to_javascript
    Regexp.new(inspect.sub('\\A','^').sub('\\Z','$').sub('\\z','$').sub(/^\//,'').sub(/\/[a-z]*$/,'').gsub(/\(\?#.+\)/, '').gsub(/\(\?-\w+:/,'('), self.options).inspect
  end
end

module BootstrapValidatorRails
  module Validators
    class Format < Validator
      def generate_data
        data = {}
        return data if unsupported?
        
        options = validator_options

        regex = options[:with].to_javascript
        regex.sub!('/^', '^')
        regex.sub!('$/', '$')
        
        data[:bv_regexp] = 'true'

        if options[:with]
          data[:bv_regexp_regexp] = regex 
        end

        if options[:message]
          data[:bv_regexp_message] = options[:message] 
        end

        data
      end

      def generate_object
        data = {}
        return data if unsupported?
        
        options = validator_options

        regex = options[:with].to_javascript
        regex.sub!('/^', '^')
        regex.sub!('$/', '$')
        
        data["regexp"] = {}

        if options[:with]
          data["regexp"]["regexp"] = regex
        end

        if options[:message]
          data["regexp"]["message"] = options[:message]
        end

        {method_key => {validators: data}}
      end
    end
  end
end
