# frozen_string_literal: true

module Lib
  module Entity
    class Order < Entity
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

      def ==(other)
        book == other.book && reader == other.reader && date == other.date
      end

      def add_nested_in(library)
        library.add(book)
        library.add(reader)
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
