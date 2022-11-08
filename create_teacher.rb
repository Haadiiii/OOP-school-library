require_relative 'teacher'

class CreateTeacher
  def new_teacher
    puts 'Creating a teacher ...'
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)

    puts "Teacher #{name} created successfully"
    teacher
  end
end
