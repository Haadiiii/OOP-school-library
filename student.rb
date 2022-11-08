require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :classroom, :id, :parent_permission, :age, :name

  def initialize(age, name, parent_permission)
    super(age, name)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  private

  def of_age?
    @age >= 18
  end
end
