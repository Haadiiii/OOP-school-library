require_relative 'book'

class CreateBook
  def new_book
    puts 'Creating a book ... '
    print 'Book Title: '
    title = gets.chomp

    print 'Book Author: '
    author = gets.chomp

    book = Book.new(title, author)
    puts "Book #{title} created successfully"
    book
  end
end
