# frozen_string_literal: true

module Lib
  module Entity
    class Author
      include Modules::Validator
      attr_reader :name, :biography

      def initialize(name, biography = ' ')
        validation(name)
        @name = name
        @biography = biography
      end

      def to_s
        "Name : #{name} \n\ Biography: #{biography}"
      end

      def eql?(other)
        to_s == other.to_s
      end

      private

      def validation(name)
        validate_class(String, name)
        validate_non_empty(name)
      end
    end
  end
end
