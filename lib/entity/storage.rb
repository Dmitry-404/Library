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

      def store
        @store ||= YAML::Store.new(File.join(STORAGE_DIR, STORAGE_FILE))
      end

      def save
        store.transaction do
          data.each do |key, value|
            store[key] = value
          end
        end
      end

      private

      def initialize_db
        if is_exist
          store.transaction do
            store.roots.to_h do |key|
              [key, store[key]]
            end
          end
        else
          create_dir
          output_data
        end
      end

      def is_exist
        Dir.exist?(STORAGE_DIR)
      end

      def create_dir
        Dir.mkdir(File.join(STORAGE_DIR))
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
