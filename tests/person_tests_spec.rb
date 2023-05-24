require 'rspec'
require 'json'
require_relative '../models/person'

describe Person do

  before :each do
    @book = Book.new('Title', 'Author')
    @person1 = Person.new(20, 'Harry')
    @person2 = Person.new(14, 'Lamra')
  end

  describe "#new" do
    it "return a new Person object" do
      @person1.should be_an_instance_of Person
    end
  end

  describe "#name" do
    it "returns the correct name" do
      @person1.name.should eql "Harry"
    end
  end

  describe "#age" do
    it "returns the correct age" do
      @person1.age.should eql 20
    end
  end

  describe "#can_use_services" do
    it "returns the true for person1" do
      @person1.can_use_services?.should be true
    end
  end

  describe "#can_use_services" do
  it "returns false for person2" do
    @person2.instance_variable_set(:@parent_permission, false)
    expect(@person2.can_use_services?).to be false
  end
end


  it "adds new rental for this person" do
    @person1.add_rental(@book, '15-03-2023')
    expect(@person1.rentals.last.date).to eql '15-03-2023'
   
  end

  it "raise an error when we give wrong argument of method" do
    lambda { @person1.add_rental('15-03-2023') }.should raise_exception ArgumentError
  end
end