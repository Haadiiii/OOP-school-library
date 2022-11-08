require './person'
require './student'
require './teacher'
require './rental'
require './book'
require_relative 'create_book'
require_relative 'create_student'
require_relative 'create_teacher'
require 'json'
require 'json/add/struct'

PersonStruct = Struct.new(:person)

class App
  attr_accessor :persons, :books, :rentals, :create_book

  def initialize
    @persons = []
    @books = []
    @rentals = []
    @create_book = CreateBook.new
    @create_student = CreateStudent.new
    @create_teacher = CreateTeacher.new
  end

  def display_book_list
    book = @create_book.new_book
    json = JSON.generate(book)
    @books << json
    File.write('books.json', @books)
  end

  def options(input)
    case input
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_a_person
    when '4'
      display_book_list
    when '5'
      rental = create_a_rental
      json = JSON.generate(rental)
      @rentals << json
      File.write('rentals.json', @rentals)
    when '6'
      list_all_rentals_by_person_id
    else
      puts 'Please choose a valid option'
    end
  end

  def list_all_books
    book_data = 'books.json'
    @books = JSON.parse(File.read(book_data)) if File.exist?(book_data) && File.read(book_data) != ''
    if @books.empty?
      puts "\nBook list is empty"
    else
      puts "\nList of all Books"
      @books.each do |book|
        book = JSON.parse(book, create_additions: true)
        puts "Title: #{book.title} Author: #{book.author}"
      end
    end
  end

  def list_all_people
    if File.exist?('persons.json') && File.read('persons.json') != ''
      @persons = JSON.parse(File.read('persons.json'),
                            create_additions: true)
    end
    if @persons.empty?
      puts "\nNo people added"
    else
      puts "\nList of all people"
      @persons.each do |person|
        person = JSON.parse(person, create_additions: true)
        puts "[#{person.person['className']}] ID: #{person.person['id']}
         Name: #{person.person['name']} Age: #{person.person['age']}"
      end
    end
  end

  def create_a_person
    print "Creating a Person\nDo you want to create a student(1) or a teacher(2)? [Enter the number]: "
    input = gets.chomp
    case input
    when '1'
      student = @create_student.new_student
      s_struct = PersonStruct.new({ name: student.name, id: student.id, className: student.class,
                                    parent_permission: student.parent_permission, age: student.age })
      json = JSON.generate(s_struct)
      @persons << json
      File.write('persons.json', @persons)
    when '2'
      teacher = @create_teacher.new_teacher
      t_struct = PersonStruct.new({ name: teacher.name, id: teacher.id, className: teacher.class,
                                    specialization: teacher.specialization, age: teacher.age })
      json = JSON.generate(t_struct)
      @persons << json
      File.write('persons.json', @persons)
    else
      puts 'Input not valid. Please enter a valid input (1) or (2)'
    end
  end

  def create_a_rental
    puts 'Creating a rental ... '

    puts 'Select a book from the following list by a number'
    @books.each_with_index do |book, index|
      book = JSON.parse(book, create_additions: true)
      puts "#{index}) Title: #{book.title} Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by a number (not from id)'
    @persons.each_with_index do |person, index|
      person = JSON.parse(person, create_additions: true)
      puts "#{index}) ID:#{person.person['id']} Name: #{person.person['name']} Age:#{person.person['age']}"
    end

    person_index = gets.chomp.to_i

    puts 'Date: yyyy-mm-dd'
    date = gets.chomp

    rental = Rental.new(date, @persons[person_index], @books[book_index])
    puts 'Rental created successfully'
    rental
  end

  def list_all_rentals
    rental_data = 'rentals.json'
    @rentals = JSON.parse(File.read(rental_data)) if File.exist?(rental_data) && File.read(rental_data) != ''

    if @rentals.empty?
      puts "\nNo current rentals"
    else
      puts "\nCurrent rentals:"
      @rentals.each do |rental|
        rental = JSON.parse(rental, create_additions: true)
        person = JSON.parse(rental.person, create_additions: true)
        book = JSON.parse(rental.book, create_additions: true)
        puts "Date: #{rental.date} - Book: #{book.title} -
        Author: #{book.author} borrowed by - [#{person.person['className']}]
        ID: #{person.person['id']} Name: #{person.person['name']} Age: #{person.person['age']} "
      end
    end
  end

  def list_all_rentals_by_person_id
    puts "\nList of all rentals by person id"

    puts 'Select a person from the following list by ID'
    list_all_people
    person_id = gets.chomp.to_i

    puts 'Rentals: '
    rental_data = 'rentals.json'
    @rentals = JSON.parse(File.read(rental_data)) if File.exist?(rental_data) && File.read(rental_data) != ''
    @rentals.each do |rental|
      rental = JSON.parse(rental, create_additions: true)
      person = JSON.parse(rental.person, create_additions: true)
      book = JSON.parse(rental.book, create_additions: true)
      if person.person['id'] == person_id.to_i
        puts "Date: #{rental.date} - Book: #{book.title} - Author: #{book.author}"
      end
      puts 'No rental found for the given id' unless person.person['id'] == person_id.to_i
    end
  end

  def quit_app
    puts 'Thank you for using my app!'
    exit(true)
  end
end
