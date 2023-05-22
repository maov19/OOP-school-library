require_relative 'person'

class Teacher < Person
  attr_accessor :subject

  def initialize(age, subject, name = 'Unknown')
    super(age, name)
    @subject = subject
  end

  def can_use_services?
    true
  end
end
