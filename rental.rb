class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [date, person, book]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
