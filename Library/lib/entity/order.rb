# frozen_string_literal: true

module Lib
  module Entity
    class Order
      include Modules::Validator
      attr_reader :book, :reader, :date

      def initialize(book, reader, date = Date.today)
        validation(book, reader, date)
        @book = book
        @reader = reader
        @date = date
      end

      def to_s
        book.to_s + reader.to_s + date.to_s
      end

      private

      def validation(book, reader, date)
        validate_class(Book, book)
        validate_class(Reader, reader)
        validate_class(Date, date)
      end
    end
  end
end

# Book - required, must be an instance of Book class.
# Reader must be an instance of Reader class
# Date must be an instance of a Ruby Date class. The default date is today's date.
