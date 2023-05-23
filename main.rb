require_relative 'app'

def main
  books = [
    # Book.new('Book 1', 'Author 1')
  ]

  people = [
    # Student.new(18, 'Classroom 1', 'Alice')
  ]

  rentals = []

  app = App.new(books, people, rentals)
  app.start
end

main
