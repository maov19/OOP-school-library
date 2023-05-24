class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rentals << self
    person.rentals << self
  end

  # def to_json(*_args)
  #   {
  #     'date' => @date,
  #     'book' => {
  #       'title' => @book.title,
  #       'author' => @book.author
  #     },
  #     'person' => {
  #       'name' => @person.name,
  #       'age' => @person.age
  #     }
  #   }.to_json
  # end


  # def self.from_json(json)
  #   data = JSON.parse(json)
  #   date = data['date']
  #   book_data = data['book']
  #   person_data = data['person']
  #   book = Book.new(book_data['title'], book_data['author'])
  #   person = Person.new(person_data['name'], person_data['age'])
  #   Rental.new(date, book, person)
  # end

  def to_json(*_args)
    {
      'date' => @date,
      'book' => @book.to_json,
      'person' => @person.to_json
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    date = data['date']
    book_data = data['book']
    person_data = data['person']
    book = Book.from_json(book_data)
    person = Person.from_json(person_data)
    Rental.new(date, book, person)
  end
end
