require_relative '../models/person'
require_relative '../models/student'
require_relative '../models/teacher'
require_relative '../models/classroom'
require_relative '../models/book'
require_relative '../models/rentals'

# 4. Create book
class CreateBookAction
  def initialize(books)
    @books = books
  end

  def execute
    puts 'Enter the book title:'
    book_title = gets.chomp

    puts 'Enter the book author:'
    book_author = gets.chomp

    book = Book.new(book_title, book_author)
    @books << book

    puts '----------------------------------------'
    puts 'Book created successfully!'
    puts '----------------------------------------'
  end
end
