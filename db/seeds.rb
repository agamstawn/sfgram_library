# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


book_list = JSON.parse(File.read('books.json'))
# 1393
book_list["books"].each do |book|
  Book.create(book.sort_by { |key| key }.to_h)
end

author_list = JSON.parse(File.read('authors.json'))
# 1258
author_list["authors"].each do |author|
  Author.create(author.sort_by { |key| key }.to_h)
end





