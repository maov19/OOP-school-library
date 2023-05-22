require_relative '../models/person'
require_relative '../models/student'
require_relative '../models/teacher'
require_relative '../models/classroom'
require_relative '../models/book'
require_relative '../models/rentals'

# 3. Create person
class CreatePersonAction
  def initialize(people)
    @people = people
  end

  def execute
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
end
