require_relative '../person'
require_relative '../classroom'
require_relative '../student'
require_relative '../teacher'
require_relative '../rental'
require_relative '../book'
require_relative '../decorator'
require_relative '../capitalizedecorator'
require_relative '../trimmerdecorator'
require_relative '../nameable'

# Compare this snippet from spec/student_spec.rb:

describe Student do
  it 'creates a new instance of the Student class' do
    student = Student.new(20, 'John', 'Maths')
    expect(student).to be_an_instance_of Student
  end

  it 'creates a new instance of the Student class with a name' do
    student = Student.new(20, 'John', 'Maths')
    expect(student.name).to eq('John')
  end

  it 'creates a new instance of the Student class with an age' do
    student = Student.new(20, 'John', 'Maths')
    expect(student.age).to eq(20)
  end

  it 'adds a rentals object to the array' do
    rental = {}
    student = Student.new(20, 'John', 'Maths')
    student.add_rental(rental)
    expect(student.rentals.length).to eq(1)
  end
end
