# frozen_string_literal: true

module Lib
  module Modules
    module Errors
      class UnexpectedClassError < StandardError
        STANDARD_MESSAGE = 'Not expected class'
        def initialize(message = STANDARD_MESSAGE)
          super(message)
        end
      end
    end
  end
end
