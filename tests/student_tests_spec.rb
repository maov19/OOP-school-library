require_relative 'helper_spec'

describe Student do
    let(:classroom) { Classroom.new('Basic Test') }
    let(:student) { Student.new(23, classroom, 'John') }
  
    describe '#new' do
      it 'creates a new Student object' do
        expect(student).to be_an_instance_of(Student)
      end
  
      it 'inherits age and name from Person' do
        expect(student.age).to eq(23)
        expect(student.name).to eq('John')
      end
  
      it 'has an assigned classroom' do
        expect(student.classroom).to eq(classroom)
      end
    end
  
    describe '#play_hooky' do
      it 'returns a string indicating playing hooky' do
        expect(student.play_hooky).to eq('¯\\_(ツ)_/¯')
      end
    end
  
    describe '#classroom_association=' do
      it 'assigns a new classroom to the student' do
        new_classroom = Classroom.new('Advanced Test')
        student.classroom_association = new_classroom
  
        expect(student.classroom).to eq(new_classroom)
      end
  
      it 'adds the student to the new classroom' do
        new_classroom = Classroom.new('Advanced Test')
        student.classroom_association = new_classroom
  
        expect(new_classroom.students).to include(student)
      end
  
      it 'does not add the student to the classroom if already present' do
        classroom.students << student
        expect { student.classroom_association = classroom }.not_to(change { classroom.students.length })
      end
    end
  end
