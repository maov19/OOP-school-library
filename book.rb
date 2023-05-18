require_relative 'rentals'

class Book
    attr_accessor :title, :author
  
    def initialize(title, author)
      @title = title
      @author = author
      @rentals = []
    end
  
    def add_rental(date, person)
      rental = Rental.new(date, self, person)
      @rentals << rental
      person.rentals << rental
    end
  
    def rentals
      @rentals.map(&:date)
    end
  end
  