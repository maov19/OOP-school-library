# List rentals
class ListRentalsAction
  def initialize(people, rentals)
    @people = people
    @rentals = rentals
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
      person_rentals = find_rentals_by_person(person)
      if person_rentals.empty?
        puts 'No rentals found.'
      else
        person_rentals.each do |rental|
          puts "- #{rental.date} - #{rental.book.title}"
        end
      end
      puts '----------------------------------------'
    end
  end

  private

  def find_person_by_name(name)
    @people.find { |person| person.name.downcase == name.downcase }
  end

  def find_rentals_by_person(person)
    @rentals.select { |rental| rental.person.name == person.name }
  end
end
