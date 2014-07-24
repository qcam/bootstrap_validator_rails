module BootstrapValidatorRails
  class ValidatorMessage
    VALIDATORS = {
      :presence => {:key => :mv_notempty, :message => :mv_notempty_message},
      :numericality => {:key => :mv_numeric_separator, :message => :mv_numeric_separator_message}
    }

    def initialize(record)
      @record = record
    end

    def attributes_of(method)
      validators = validators_on(method)
      validators.inject({}) do |attributes, validator|
        if support?(validator.kind)
          attributes.merge(validator_key_of(validator))
          attributes.merge(validator_message_of(method, validator.kind))
        end
      end
    end

    def support?(kind)
      VALIDATORS.has_key?(kind)
    end

    def validators_on(method)
      @record.class.validators_on(method)
    end
    
    def validator_message_of(method, kind)
      message = @record.errors.generate_message(method, kind, default: "is invalid")
      {VALIDATORS[kind][:message] => message} 
    end
    
    def validator_key_of(validator)
      {VALIDATORS[validator.kind][:key] => ''}
    end
  end
end
