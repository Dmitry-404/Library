# frozen_string_literal: true

module Lib
  module Modules
    module Errors
      class PresentInLibraryError < StandardError
        STANDARD_MESSAGE = 'Object present in library'
        def initialize(message = STANDARD_MESSAGE)
          super(message)
        end
      end
    end
  end
end
