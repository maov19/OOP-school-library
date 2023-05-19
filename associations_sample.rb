require_relative 'person'
require_relative 'classroom'
require_relative 'book'
require_relative 'rentals'

# Create a classroom
classroom = Classroom.new('Math')

# Create students
student1 = Student.new(18, classroom, 'John')
student2 = Student.new(17, classroom, 'Peter')

# Add students to the classroom
classroom.add_student(student1)
classroom.add_student(student2)

# Print students in the classroom
puts "Students in #{classroom.label} classroom:"
classroom.students.each do |student|
  puts "- #{student.name}"
end

# Print the classroom for each student
puts 'Classroom for each student:'
puts "#{student1.name}: #{student1.classroom.label}"
puts "#{student2.name}: #{student2.classroom.label}"

# Create a Person
person = Person.new(25, 'Alice')
person2 = Person.new(32, 'Martin')

# Create a Book
book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
book2 = Book.new('1984', 'George Orwell')

# Add the Rental to the Book
book.add_rental(person, '01-01-2023')
book2.add_rental(person2, '02-01-2023')
book.add_rental(person2, '02-01-2023')

# Print the rentals of the Book
puts "Rentals of #{book.title}:"
book.rentals.each do |item|
  puts "- #{item.date} rented by #{item.person.name}"
end

# Print the rentals of the Person
puts "Rentals of #{person.name}:"
person.rentals.each do |item|
  puts "- #{item.date} rented #{item.book.title}"
end
