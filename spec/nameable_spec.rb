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

describe Nameable do
  it 'creates a new instance of the Person class' do
    nameable = Nameable.new
    expect(nameable).to be_an_instance_of Nameable
  end

  it '#correct_name raises a NotImplemented error when invoked' do
    nameable = Nameable.new
    expect { nameable.correct_name }.to raise_error(NotImplementedError)
  end
end
