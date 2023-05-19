require_relative 'app'

def main
  books = [
    Book.new('Book 1', 'Author 1')
  ]

  people = [
    Student.new(18, 'Classroom 1', 'Alice')
  ]

  app = App.new(books, people)
  app.start
end

main
