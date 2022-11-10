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

# Compare this snippet from spec/person_spec.rb:

describe Person do
  it 'creates a new instance of the Person class' do
    person = Person.new(20, 'John')
    expect(person).to be_an_instance_of Person
  end

  it 'creates a new instance of the Person class with a name' do
    person = Person.new(20, 'John')
    expect(person.name).to eq('John')
  end

  it 'creates a new instance of the Person class with an age' do
    person = Person.new(20, 'John')
    expect(person.age).to eq(20)
  end

  it '#correct_name returns the name of the person object' do
    person = Person.new(23, 'John')
    expect(person.can_use_services?).to eq(false)
  end

  it '#correct_name returns the name of the person object' do
    person = Person.new(23, 'John')
    expect(person.correct_name).to eq('John')
  end

  it 'adds a rentals object to the array' do
    rental = {}
    person = Person.new(23, 'John')
    person.add_rental(rental)
    expect(person.rentals.length).to eq(1)
  end
end
