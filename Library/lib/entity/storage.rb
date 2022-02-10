# frozen_string_literal: true

module Lib
  module Entity
    class Storage
      STORAGE_DIR = 'db'
      STORAGE_FILE = 'store.yml'
      attr_accessor :data

      def initialize
        @data = initialize_db
      end

      def save
        store = YAML::Store.new(File.join(STORAGE_DIR, STORAGE_FILE))

        store.transaction do
          data.each { |key, value| store[key] = value }
        end
      end

      private

      def initialize_db
        if Dir.exist?(STORAGE_DIR)
          store = YAML::Store.new(File.join(STORAGE_DIR, STORAGE_FILE))
          store.transaction do
            store.roots.to_h { |key| [key, store[key]] }
          end
        else
          Dir.mkdir(File.join(STORAGE_DIR))
          output_data
        end
      end

      def output_data
        {
          authors: [],
          books: [],
          readers: [],
          orders: []
        }
      end
    end
  end
end
