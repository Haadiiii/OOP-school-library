require_relative './spec_helper'

describe CapitalizeDecorator do
  it 'creates a new instance of the CapitalizeDecorator class' do
    decorator = CapitalizeDecorator.new('John')
    expect(decorator).to be_an_instance_of CapitalizeDecorator
  end

  it 'creates a new instance of the CapitalizeDecorator class with a name' do
    decorator = CapitalizeDecorator.new('John')
    expect(decorator.nameable).to eq('John')
  end

  it 'creates a new instance of the CapitalizeDecorator class with a capitalized name' do
    decorator = CapitalizeDecorator.new('john')
    expect(decorator.correct_name).to eq('JOHN')
  end
end
