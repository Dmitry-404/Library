# frozen_string_literal: true

module Lib
  module Entity
    class Storage
      STORAGE_DIR = 'db'
      STORAGE_FILE = 'store.yml'
      attr_accessor :data

      def initialize
        load_data
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

      def load_data
        create_dir unless dir_exist?
        @data = store.transaction do
          store.roots.to_h do |key|
            [key, store[key]]
          end
        end
        @data = empty_data if @data.empty?
      end

      def dir_exist?
        Dir.exist?(STORAGE_DIR)
      end

      def create_dir
        Dir.mkdir(File.join(STORAGE_DIR))
      end

      def empty_data
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
