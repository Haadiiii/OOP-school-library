require_relative './spec_helper'

describe Classroom do
  it 'creates a new instance of the Classroom class' do
    classroom = Classroom.new('Maths')
    expect(classroom).to be_an_instance_of Classroom
  end

  it 'creates a new instance of the Classroom class with an age' do
    classroom = Classroom.new('Maths')
    expect(classroom.label).to eq('Maths')
  end

  it 'adds a student object to the array' do
    student = {}
    classroom = Classroom.new('Maths')
    classroom.add_student(student)
    expect(classroom.student.length).to eq(1)
  end
end
