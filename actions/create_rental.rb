require_relative '../models/person'
require_relative '../models/student'
require_relative '../models/teacher'
require_relative '../models/classroom'
require_relative '../models/book'
require_relative '../models/rentals'

# 5. Create rental
class CreateRentalAction
  def initialize(books, people, rentals)
    @books = books
    @people = people
    @rentals = rentals
  end

  def execute
    puts 'Enter the book title:'
    book_title = gets.chomp.downcase
    book = find_book_by_title(book_title)

    puts 'Enter the person name:'
    person_name = gets.chomp.downcase
    person = find_person_by_name(person_name)

    puts 'Enter the rental date (DD-MM-YYYY):'
    rental_date = gets.chomp

    if book && person
      rental = Rental.new(rental_date, book, person)
      @rentals << rental
      puts '----------------------------------------'
      puts "Rental created: #{rental.date} - #{rental.book.title} - #{rental.person.name}"
    else
      puts '----------------------------------------'
      puts 'Failed to create rental.'
    end
    puts '----------------------------------------'
  end

  private

  def find_book_by_title(title)
    book = @books.find { |item| item.title.downcase == title.downcase }
    puts "Book '#{title}' not found." unless book
    book
  end

  def find_person_by_name(name)
    @people.find { |person| person.name.downcase == name.downcase }
  end
end
