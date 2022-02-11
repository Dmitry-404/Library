# frozen_string_literal: true

module Lib
  module Modules
    module Validator
      def validate_class(expected_class, instance)
        raise UnexpectedClassError unless instance.is_a?(expected_class)
      end

      def validate_non_empty(string)
        raise EmptyStringError if string.empty?
      end

      def validate_positive(number)
        raise NegativeOrZeroError unless number.positive?
      end
    end
  end
end
