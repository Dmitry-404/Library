# frozen_string_literal: true

require 'yaml/store'
require 'date'
require 'pry'
require_relative 'lib/modules/errors/empty_string_error'
require_relative 'lib/modules/errors/negative_or_zero_error'
require_relative 'lib/modules/errors/unexpected_class_error'
require_relative 'lib/modules/errors/present_in_library_error'
require_relative 'lib/modules/validator'
require_relative 'lib/entity/author'
require_relative 'lib/entity/book'
require_relative 'lib/entity/order'
require_relative 'lib/entity/reader'
require_relative 'lib/entity/storage'
require_relative 'lib/entity/library'
