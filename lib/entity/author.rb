# frozen_string_literal: true

module Lib
  module Entity
    class Author < Entities
  
      attr_reader :name, :biography

      def initialize(name, biography = ' ')
        validation(name)
        @name = name
        @biography = biography
      end

      def to_s
        "Name : #{name} \n\ Biography: #{biography}"
      end

      def ==(other)
        name == other.name && biography == other.biography
      end
      private

      def validation(name)
        validate_class(String, name)
        validate_non_empty(name)
      end
    end
  end
end
