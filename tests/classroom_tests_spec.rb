require_relative 'helper_spec'


describe Classroom do
  let(:student1) { Student.new(25, 'Maximilianus', true) }
  let(:student2) { Student.new(13, 'Zeus', false) }
  let(:classroom) { Classroom.new('Frontend') }

  describe '#initialize' do
    it 'creates a new instance of Classroom' do
      expect(classroom).to be_an_instance_of Classroom
    end

    it 'initializes with an empty array of students' do
      expect(classroom.students).to be_empty
    end

    it 'sets the label correctly' do
      expect(classroom.label).to eq 'Frontend'
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom.add_student(student1)
      expect(classroom.students).to include(student1)
    end

    it 'sets the classroom attribute of the student' do
      classroom.add_student(student2)
      expect(student2.classroom).to eq classroom
    end
  end
end
