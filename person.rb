require './nameable'
require './decorator'
require './capitalizedecorator'
require './trimmerdecorator'

class Person < Nameable
  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    @parent_permission || is_of_age?
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name
person1 = CapitalizeDecorator.new(person)

puts person1.correct_name

person2 = TrimmerDecorator.new(person1)
puts person2.correct_name
