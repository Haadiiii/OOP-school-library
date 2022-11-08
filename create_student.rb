require_relative 'student'

class CreateStudent
  def new_student
    puts 'Creating a student ...'
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase
    parent_permission = parent_permission == 'Y'

    student = Student.new(age, name, parent_permission: parent_permission)
    puts "Student #{name} created successfully"
    student
  end
end
