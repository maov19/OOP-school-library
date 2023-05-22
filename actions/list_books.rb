require_relative '../models/person'
require_relative '../models/student'
require_relative '../models/teacher'
require_relative '../models/classroom'
require_relative '../models/book'
require_relative '../models/rentals'

# 1. List all books
class ListBooksAction
  def initialize(books)
    @books = books
  end

  def execute
    puts '----------------------------------------'
    puts 'All Books:'
    @books.each do |book|
      puts "- #{book.title} by #{book.author}"
      puts '----------------------------------------'
    end
  end
end
