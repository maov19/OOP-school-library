require_relative 'rentals'

class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    # rental = Rental.new(date, self, person)
    @rentals << rental
    # person.rentals << rental
    rental.person.rentals << rental
  end

  attr_reader :rentals
end
