require_relative 'helper_spec'

describe Rental do
  let(:book) { Book.new('Title', 'Author') }
  let(:person) { Person.new(25, 'John Doe') }
  let(:date) { '24-05-2023' }
  let(:rental) { Rental.new(date, book, person) }

  describe '#initialize' do
    it 'sets the date, book, and person attributes' do
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'adds itself to the rentals array of the book and person' do
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end

  describe '#to_json' do
    it 'returns the rental data in JSON format' do
      json = rental.to_json
      data = JSON.parse(json)

      expect(data['date']).to eq(date)
      expect(data['book']['title']).to eq(book.title)
      expect(data['book']['author']).to eq(book.author)
      expect(data['person']['age']).to eq(person.age)
      expect(data['person']['name']).to eq(person.name)
    end
  end

  describe '.from_json' do
    it 'returns a new Rental object from JSON data' do
      json = rental.to_json
      new_rental = Rental.from_json(json)

      expect(new_rental.date).to eq(date)
      expect(new_rental.book.title).to eq(book.title)
      expect(new_rental.book.author).to eq(book.author)
      expect(new_rental.person.age).to eq(person.age)
      expect(new_rental.person.name).to eq(person.name)
    end
  end
end
