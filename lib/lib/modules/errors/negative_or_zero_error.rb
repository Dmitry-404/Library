# frozen_string_literal: true

module Lib
  module Modules
    module Errors
      class NegativeOrZeroError < StandardError
        STANDARD_MESSAGE = 'Integer was negative or zero'
        def initialize(message = STANDARD_MESSAGE)
          super(message)
        end
      end
    end
  end
end
