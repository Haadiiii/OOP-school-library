class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(person, date)
    @rental << Rental.new(date, self, person)
  end
end
