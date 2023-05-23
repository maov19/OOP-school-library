require 'json'
require_relative 'list_books'
require_relative 'list_people'
require_relative 'create_person'
require_relative 'create_book'
require_relative 'create_rental'
require_relative 'list_rentals'

# Data preservation class
class PreserveData
  def initialize(books, people, rentals)
    @books = books
    @people = people
    @rentals = rentals
  end

  def save_data_to_files
    save_books
    save_people
    save_rentals
  end

  def load_data_from_files
    load_books
    load_people
    load_rentals
  end

  private

  def save_books
    File.write('books.json', JSON.pretty_generate(@books.map(&:to_json)))
  end 

  def save_people
    File.write('people.json', JSON.pretty_generate(@people.map(&:to_json)))
  end

  def save_rentals
    rentals_data = @rentals.map(&:to_json)
    File.write('rentals.json', JSON.pretty_generate(rentals_data))
  end

  def load_books
    if File.exist?('books.json')
      book_file = File.read('books.json')
      book_data = JSON.parse(book_file)
      @books.clear
      book_data.each do |book_json|
        book = Book.from_json(book_json)
        @books << book
      end
    else
      puts 'No books data file found.'
    end
  rescue JSON::ParserError => e
    puts 'Error parsing books.json file:', e.message
  end
  
  def load_people
    if File.exist?('people.json')
      people_file = File.read('people.json')
      people_data = JSON.parse(people_file)
      @people.clear
      people_data.each do |people_json|
        person = Person.from_json(people_json)
        @people << person
      end
    else
      puts 'No people data file found.'
    end
  rescue JSON::ParserError => e
    puts 'Error parsing people.json file:', e.message
  end 

  def load_rentals
    if File.exist?('rentals.json')
      rentals_file = File.read('rentals.json')
      rentals_data = JSON.parse(rentals_file)
      @rentals.clear
      rentals_data.each do |rental_json|
        rental = Rental.from_json(rental_json)
        @rentals << rental
      end
    else
      puts 'No rentals data file found.'
    end
  rescue JSON::ParserError => e
    puts 'Error parsing rentals.json file:', e.message
  end
end