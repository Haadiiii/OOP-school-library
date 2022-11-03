class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @person = person
    person.rentals << self unless person.rentals.include?(self)
    @book = book
    book.rental << self unless book.rental.include?(self)
  end
end
