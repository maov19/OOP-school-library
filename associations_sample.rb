require_relative 'classroom'
require_relative 'book'
require_relative 'rentals'
require 'date'

def run_example
  classroom = Classroom.new('Math Class')
  student = Student.new(18, classroom, 'John Doe')
  classroom.add_student(student)
  
  book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
  person = Person.new(25, 'Alice')
  book.add_rental( '01-01-2023', person)
  puts person.name # person's name
  puts classroom.subject #classroom name
  puts book.rentals # rental's date
  puts book.title # re book info
end

run_example
