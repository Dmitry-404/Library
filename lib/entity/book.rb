# frozen_string_literal: true

module Lib
  module Entity
    class Book
      include Modules::Validator
      attr_reader :title, :author

      def initialize(title, author)
        validation(title, author)
        @title = title
        @author = author
      end

      def to_s
        "Title : #{title} \n\ Author : #{author}\n"
      end

      def eql?(other)
        to_s == other.to_s
      end

      private

      def validation(title, author)
        validate_class(String, title)
        validate_non_empty(title)
        validate_class(Author, author)
      end
    end
  end
end
