require_relative './spec_helper'

describe Decorator do
  it 'creates a new instance of the Decorator class' do
    decorator = Decorator.new('John')
    expect(decorator).to be_an_instance_of Decorator
  end

  it 'creates a new instance of the Decorator class with a name
    ' do
    decorator = Decorator.new('John')
    expect(decorator.nameable).to eq('John')
  end
end
