# frozen_string_literal: true

module Lib
  module Modules
    module Errors
      class EmptyStringError < StandardError
        STANDARD_MESSAGE = 'String was empty'
        def initialize(message = STANDARD_MESSAGE)
          super(message)
        end
      end
    end
  end
end
