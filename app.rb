require_relative './actions/list_books'
require_relative './actions/list_people'
require_relative './actions/create_person'
require_relative './actions/create_book'
require_relative './actions/create_rental'
require_relative './actions/list_rentals'
require_relative './actions/preserve_data'

# App for entry point
class App
  def initialize(books, people, rentals)
    @books = books
    @people = people
    @rentals = rentals
    @actions = {
      1 => ListBooksAction.new(books),
      2 => ListPeopleAction.new(people),
      3 => CreatePersonAction.new(people),
      4 => CreateBookAction.new(books),
      5 => CreateRentalAction.new(books, people),
      6 => ListRentalsAction.new(people)
    }
    @data_preserver = PreserveData.new(books, people, rentals)
  end

  def start
    @data_preserver.load_data_from_files
    loop do
      display_menu
      choice = gets.chomp.to_i
      break if choice.zero?

      action = @actions[choice]
      if action
        action.execute
      else
        puts 'Invalid choice.'
      end
    end
    @data_preserver.save_data_to_files
    puts '----------------------------------------'
  end

  def display_menu
    puts 'What would you like to do?'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person ID'
    puts '0. Quit'
  end
end
