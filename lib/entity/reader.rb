# frozen_string_literal: true

module Lib
  module Entity
    class Reader
      include Modules::Validator
      attr_reader :name, :email, :city, :street, :house

      def initialize(name, email, city, street, house)
        validation(name, email, city, street, house)
        @name = name
        @email = email
        @city = city
        @street = street
        @house = house
      end

      def to_s
        " Name: #{name}\n\ Email: #{email}\n\ City: #{city}\n\ Street: #{street} #{house}\n"
      end

      def eql?(other)
        to_s == other.to_s
      end

      private

      def validation(name, email, city, street, house)
        validate_class(String, name)
        validate_non_empty(name)
        validate_class(String, email)
        validate_non_empty(email)
        validate_class(String, city)
        validate_non_empty(city)
        validate_class(String, street)
        validate_non_empty(street)
        validate_class(Integer, house)
        validate_positive(house)
      end
    end
  end
end
