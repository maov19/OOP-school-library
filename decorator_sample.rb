require_relative 'person'
require_relative 'nameable'
require_relative 'base_decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'student'
require_relative 'book'


def run_example
  person = Person.new(22, 'maximilianus')
  puts person.correct_name
  capitalized_person = CapitalizeDecorator.new(person)
  puts capitalized_person.correct_name
  capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
  puts capitalized_trimmed_person.correct_name
end

run_example

