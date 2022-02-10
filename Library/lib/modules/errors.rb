# frozen_string_literal: true

module Lib
  module Modules
    module Errors
      class EmptyStringError
        STANDARD_MESSAGE = 'String was empty'
        def initialize(message = STANDARD_MESSAGE)
          super(message)
        end
      end

      class UnexpectedClassError
        STANDARD_MESSAGE = 'Not expected class'
        def initialize(message = STANDARD_MESSAGE)
          super(message)
        end
      end

      class NegativeOrZeroError
        STANDARD_MESSAGE = 'Integer was negative or zero'
        def initialize(message = STANDARD_MESSAGE)
          super(message)
        end
      end
    end
  end
end
