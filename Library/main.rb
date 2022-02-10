# frozen_string_literal: true

require_relative 'autoload'

library = Lib::Entity::Library.new

pushkin = Lib::Entity::Author.new('Pushkin')
gogol = Lib::Entity::Author.new('Gogol')
bulgakov = Lib::Entity::Author.new('Bulgakov')
tolstoy = Lib::Entity::Author.new('Tolstoy')
library.add(pushkin)
library.add(gogol)
library.add(bulgakov)
library.add(tolstoy)
pushkin_book_dubrovski = Lib::Entity::Book.new('Dubrovski', pushkin)
pushkin_book_ruslan_ludmila = Lib::Entity::Book.new('Ruslan and Ludmila', pushkin)
bulgakov_book_master_and_margarita = Lib::Entity::Book.new('Master and Margarita', bulgakov)
gogol_book_dead = Lib::Entity::Book.new('Dead souls', gogol)
gogol_book_taras_bulba = Lib::Entity::Book.new('Taras Bulba', gogol)
tolstoy_book_war_peace = Lib::Entity::Book.new('War and Peace', tolstoy)
library.add(pushkin_book_dubrovski)
library.add(pushkin_book_ruslan_ludmila)
library.add(bulgakov_book_master_and_margarita)
library.add(gogol_book_dead)
library.add(gogol_book_taras_bulba)
library.add(tolstoy_book_war_peace)

user1 = Lib::Entity::Reader.new('user1', 'user1@gmail.com', 'Dnipro', 'Gogol street', 21)
user2 = Lib::Entity::Reader.new('user2', 'user2@gmail.com', 'Odessa', 'Pushkin street', 4)
user3 = Lib::Entity::Reader.new('user3', 'user3@gmail.com', 'Kuiv', 'Pushkin street', 34)
user4 = Lib::Entity::Reader.new('user4', 'user4@gmail.com', 'Odessa', 'Pushkin street', 42)
library.add(user1)
library.add(user2)
library.add(user3)
library.add(user4)

user1_order1 = Lib::Entity::Order.new(pushkin_book_dubrovski, user1)
user3_order1 = Lib::Entity::Order.new(pushkin_book_dubrovski, user3)
user4_order1 = Lib::Entity::Order.new(pushkin_book_dubrovski, user4)
user2_order1 = Lib::Entity::Order.new(pushkin_book_ruslan_ludmila, user2)
user1_order2 = Lib::Entity::Order.new(gogol_book_dead, user1)
user2_order2 = Lib::Entity::Order.new(gogol_book_dead, user2)
user3_order2 = Lib::Entity::Order.new(gogol_book_dead, user3)
user3_order3 = Lib::Entity::Order.new(gogol_book_taras_bulba, user3)
user4_order2 = Lib::Entity::Order.new(gogol_book_taras_bulba, user4)
user1_order3 = Lib::Entity::Order.new(tolstoy_book_war_peace, user1)
user3_order4 = Lib::Entity::Order.new(tolstoy_book_war_peace, user3)
library.add(user1_order1)
library.add(user1_order2)
library.add(user1_order3)
library.add(user2_order1)
library.add(user2_order2)
library.add(user3_order1)
library.add(user3_order2)
library.add(user3_order3)
library.add(user3_order4)
library.add(user4_order1)
library.add(user4_order2)

puts "Top readers\n"
library.top_readers.each { |reader| puts reader.to_s }
puts "\nMost popular books\n"
library.top_books.each { |book| puts "#{book}\n" }
puts "\nNumber of readers of the most popular books: #{library.number_of_readers_of_the_most_popular_books}"

library.save
