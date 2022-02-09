# frozen_string_literal: true

module Lib
  module Entity
    class Library
      include Modules::Validator
      AVAILABLE_ENTITY = [Author, Book, Reader, Order].freeze
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
        top_obj(:reader, :book, amount)
      end

      def top_books(_amount = 1)
        top_obj(:book, :reader, 1)
      end

      def number_of_readers_of_the_most_popular_books(amount = 3)
        @orders.select { |order| top_books(amount).include?(order.book) }.uniq(&:reader).count
      end

      def add(object)
        if AVAILABLE_ENTITY.include?(object.class)
          nested_objects(object)
          
          get_property_by_class(object.class) << object unless is_equal(object)
        else
          raise UnexpectedClassError
        end
      end

      private

      def fetch_top_objects(grouped_by, uniqued_by, amount)
        @orders.group_by(&grouped).transform_values do |values|
          values.uniq(&uniqued).count
        end.to_a.max_by(amount, &:last).map(&:first)
      end

      def get_property_by_class(class_of_obj)
        {
          Lib::Entity::Author => authors,
          Lib::Entity::Book => books,
          Lib::Entity::Reader => readers,
          Lib::Entity::Order => orders
        }[class_of_obj]
      end

      def object_present?(object)
        property = get_property_by_class(object.class)
        property.include?(object)
      end

      def nested_objects(object)
        case object
        when Book
          add(object.author)

        when Order
          add(object.reader)
          add(object.book)
        end
      end
    end
  end
end
