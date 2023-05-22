list_people_rb
require_relative '../models/person'
require_relative '../models/student'
require_relative '../models/teacher'
require_relative '../models/classroom'
require_relative '../models/book'
require_relative '../models/rentals'

# 2. List all people
class ListPeopleAction
  def initialize(people)
    @people = people
  end

  def execute
    puts '----------------------------------------'
    puts 'All People:'
    @people.each do |person|
      puts "- #{person.name} (#{person.class})"
      puts '----------------------------------------'
    end
  end
end
