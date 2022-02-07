# frozen_string_literal: true

module Lib
  module Entity
    require_relative '../../autoload'

    class Library
      include Modules::Validator
      STORAGE_FILE = 'store.yml'
      attr_reader :authors, :books, :readers, :orders

      def initialize
        @storage = Storage.new
        data = @storage.data
        @authors = data[:authors]
        @books = data[:books]
        @readers = data[:readers]
        @orders = data[:orders]
      end

      def save
        @storage.save
      end

      def top_readers(amount = 1)
        @orders.group_by(&:reader).transform_values do |values|
          values.uniq(&:book).count
        end.to_a.max_by(amount, &:last).map(&:first)
      end

      def top_books(amount = 1)
        @orders.group_by(&:book).transform_values do |values|
          values.uniq(&:reader).count
        end.to_a.max_by(amount, &:last).map(&:first)
      end

      def number_of_readers_of_the_most_popular_books(amount = 3)
        @orders.select { |order| top_books(amount).include?(order.book) }.uniq(&:reader).count
      end

      def add(object)
        case object
        when Author
          @authors << object
        when Book
          @books << object
        when Reader
          @readers << object
        when Order
          @orders << object
        else
          raise UnexpectedClassError
        end
      end
    end
  end
end
