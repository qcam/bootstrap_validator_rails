module BootstrapValidatorRails
  CONFIGURATION = {
    :unsupported_options => [:if, :unless]
  }
  VALIDATOR_SUPPORTED = [:presence, :numericality, :length, :format, :acceptance]
end
