require_relative '../book'
require_relative '../person'
require_relative '../classroom'
require_relative '../student'
require_relative '../teacher'
require_relative '../rental'

# Compare this snippet from spec/person_spec.rb:

describe Book do
  it 'creates a new instance of the Book class' do
    book = Book.new('Wobbly wallops', 'Arthur')
    expect(book).to be_an_instance_of Book
  end

  it 'adds a rentals object to the array' do
    rental = {}
    name = Book.new('Js Master', 'John')
    name.add_rental(rental)
    expect(name.rentals.length).to eq(1)
  end
end
