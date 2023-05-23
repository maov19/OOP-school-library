require_relative '../utils/nameable'
require_relative 'rentals'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    person = Person.new(data['age'], data['name'])
    person
  end

  def to_json(*_args)
    {
      'name' => @name,
      'age' => @age,
    }.to_json
  end

  private

  def of_age?
    @age >= 18
  end
end
