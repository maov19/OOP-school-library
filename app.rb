require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rentals'

class App
  def initialize(books, people)
    @books = books
    @people = people
  end

  def start
    loop do
      display_menu
      choice = gets.chomp.to_i
      process_choice(choice)
      break if choice.zero?
    end
    puts '----------------------------------------'
  end

  def process_choice(choice)
    case choice
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals_for_person
    end
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

  def list_all_books
    puts '----------------------------------------'
    puts 'All Books:'
    @books.each do |book|
      puts "- #{book.title} by #{book.author}"
      puts '----------------------------------------'
    end
  end

  def list_all_people
    puts '----------------------------------------'
    puts 'All People:'
    @people.each do |person|
      puts "- #{person.name} (#{person.class})"
      puts '----------------------------------------'
    end
  end

  def create_person
    puts 'Enter the person type (student/teacher):'
    person_type = gets.chomp.downcase

    puts 'Enter the person\'s name:'
    person_name = gets.chomp

    case person_type
    when 'student'
      create_student(person_name)
    when 'teacher'
      create_teacher(person_name)
    else
      puts 'Invalid person type.'
    end
  end

  def create_student(person_name)
    puts 'Enter the person\'s age:'
    person_age = gets.chomp.to_i

    puts 'Enter the classroom:'
    person_classroom = gets.chomp

    student = Student.new(person_age, person_classroom, person_name)
    @people << student
    puts '----------------------------------------'
    puts 'Student created successfully!'
    puts '----------------------------------------'
  end

  def create_teacher(person_name)
    puts 'Enter the person\'s age:'
    person_age = gets.chomp.to_i

    puts 'Enter the subject:'
    person_subject = gets.chomp

    teacher = Teacher.new(person_age, person_subject, person_name)
    @people << teacher

    puts '----------------------------------------'
    puts 'Teacher created successfully!'
    puts '----------------------------------------'
  end

  def create_book
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

  def find_book_by_title(title)
    book = @books.find { |item| item.title.downcase == title.downcase }
    puts "Book '#{title}' not found." unless book
    book
  end

  def find_person_by_name(name)
    @people.find { |person| person.name.downcase == name.downcase }
  end

  def create_rental
    puts 'Enter the book title:'
    book_title = gets.chomp.downcase
    book = find_book_by_title(book_title)

    puts 'Enter the person name:'
    person_name = gets.chomp.downcase
    person = find_person_by_name(person_name)

    puts 'Enter the rental date (DD-MM-YYYY):'
    rental_date = gets.chomp

    if book && person
      rental = book.add_rental(person, rental_date)
      puts '----------------------------------------'
      puts "Rental created: #{rental.date} - #{rental.book.title} - #{rental.person.name}"
    else
      puts '----------------------------------------'
      puts 'Failed to create rental.'
    end
    puts '----------------------------------------'
  end

  def list_rentals_for_person
    puts 'Enter the person name:'
    person_name = gets.chomp.downcase

    person = find_person_by_name(person_name)
    if person.nil?
      puts 'Person not found.'
    else
      puts '----------------------------------------'
      puts "Rentals for #{person.name}:"
      person.rentals.each do |rental|
        puts "- #{rental.date} - #{rental.book.title}"
        puts '----------------------------------------'
      end
    end
  end
end
