require_relative 'helper_spec'

describe Book do
  # let(:date) { '24-05-2023' }
  before :each do
    @book = Book.new('Title', 'Author')
    @person = Person.new(20, 'Mike')
    # @rentals = Rental.new(date, book, person)
  end

  describe '#new' do
    it 'returns a new instance of the Book class' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'returns the books title' do
      expect(@book.title).to eql 'Title'
    end
  end

  describe '#author' do
    it 'returns the books author' do
      expect(@book.author).to eql 'Author'
    end
  end

  describe '#add_rental' do
    it 'adds a new rental for the book' do
      @book.add_rental(@person, '05-05-2020')
      expect(@book.rentals.last.date).to eql '05-05-2020'
    end

    it 'raises an ArgumentError when called without a person argument' do
      expect { @book.add_rental('05-05-2020') }.to raise_error(ArgumentError)
    end
  end
end
