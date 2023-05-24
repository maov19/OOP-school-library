require_relative 'app'

def main
  books = [
    Book.new('Book 1', 'Author 1'),
    Book.new('Book 2', 'Author 2')
  ]

  people = [
    Person.new(18, 'Alice'),
    Person.new(20, 'Bob')
  ]

  rentals = []

  app = App.new(books, people, rentals)
  app.start
end

main
