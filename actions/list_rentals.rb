list_rentals.rb
require_relative '../models/person'
require_relative '../models/student'
require_relative '../models/teacher'
require_relative '../models/classroom'
require_relative '../models/book'
require_relative '../models/rentals'

# 6. List rentals
class ListRentalsAction
  def initialize(people)
    @people = people
  end

  def execute
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

  private

  def find_person_by_name(name)
    @people.find { |person| person.name.downcase == name.downcase }
  end
end
