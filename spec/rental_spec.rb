require_relative './spec_helper'

describe Rental do
  it 'creates a new instance of the Rental class' do
    rental = Rental.new('2021-01-01', '2021-01-01', 'John')
    expect(rental).to be_an_instance_of Rental
  end

  it 'creates a new instance of the Rental class with a date' do
    rental = Rental.new('2021-01-01', '2021-01-01', 'John')
    expect(rental.date).to eq('2021-01-01')
  end

  it 'creates a new instance of the Rental class with a person' do
    rental = Rental.new('2021-01-01', '2021-01-01', 'John')
    expect(rental.person).to eq('2021-01-01')
  end

  it 'creates a new instance of the Rental class with a book' do
    rental = Rental.new('2021-01-01', '2021-01-01', 'John')
    expect(rental.book).to eq('John')
  end
end
