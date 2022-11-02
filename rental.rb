class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @person = person
    person.rental << self unless person.rental.include?(self)
    @book = book
    book.rental << self unless book.rental.include?(self)
  end
end
