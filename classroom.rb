require_relative 'student'

class Classroom
    attr_accessor :subject, :students
  
    def initialize(subject)
      @subject = subject
      @students = []
    end
  
    def add_student(student)
      @students << student
      student.classroom = self
    end
  end
  