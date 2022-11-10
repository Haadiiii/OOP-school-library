require_relative './spec_helper'

describe TrimmerDecorator do
  it 'creates a new instance of the TrimmerDecorator class' do
    decorator = TrimmerDecorator.new('John')
    expect(decorator).to be_an_instance_of TrimmerDecorator
  end

  it 'creates a new instance of the TrimmerDecorator class with a name' do
    decorator = TrimmerDecorator.new('John')
    expect(decorator.nameable).to eq('John')
  end

  it 'creates a new instance of the TrimmerDecorator class with a trimmed name' do
    decorator = TrimmerDecorator.new('John ')
    expect(decorator.nameable).to eq('John ')
  end

  it 'trims strings longer than 10 letters' do
    name = TrimmerDecorator.new('cephalothorax')
    expect(name.correct_name).to eq('cephalotho')
  end
end
