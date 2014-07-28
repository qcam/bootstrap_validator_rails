class Regexp
  def to_javascript
    Regexp.new(inspect.sub('\\A','^').sub('\\Z','$').sub('\\z','$').sub(/^\//,'').sub(/\/[a-z]*$/,'').gsub(/\(\?#.+\)/, '').gsub(/\(\?-\w+:/,'('), self.options).inspect
  end
end

module BootstrapValidatorRails
  module Validators
    class Format
      def initialize(record, method, validator)
        @record, @method, @validator = record, method, validator
      end

      def generate_data
        data = {}
        options = @validator.options
        regex = options[:with].to_javascript
        
        data[:bv_regexp] = 'true'

        if options[:with]
          data[:bv_regexp_regexp] = regex 
        end

        if options[:message]
          data[:bv_regexp_message] = options[:message] 
        end

        data
      end
    end
  end
end
