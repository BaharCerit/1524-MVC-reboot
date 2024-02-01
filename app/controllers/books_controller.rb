require_relative '../views/books_view'

class BooksController
  def initialize
    @view = BooksView.new
  end

  def list
    # Fetch ALL the books from Active Record
    # Display all books in View
    books = Book.all
    @view.display_list(books)
  end

  def add
    # Ask for title => View
    # Ask for price
    # Ask for author
    # Ask for category

    # Active Record
    title = @view.ask_for("title")
    category = @view.ask_for("category")
    price = @view.ask_for("price").to_i
    author = @view.ask_for("author")


    new_book = Book.new(title: title, category: category, price: price, author: author)
    new_book.save

    list()
    # Create a new book
    # Save a new book
  end

  def edit
    # Fetch ALL the books from Active Record
    # Display all books
    books = Book.all
    @view.display_list(books)

    # Ask for which book by ID
    id = @view.ask_for("id").to_i
    # Find the book
    book = Book.find(id)

    # Ask for title => View
    new_title = @view.ask_for("title")
    book.title = new_title

    # Ask for category
    new_category = @view.ask_for("category")
    book.category = new_category

    # Ask for price
    new_price = @view.ask_for("price").to_i
    book.price = new_price

    # Ask for author
    new_author = @view.ask_for("author")
    book.author = new_author

    # Edit the data
    book.save
    # Save the new witrh new data

  end

  def delete
    # Fetch ALL the books from Active Record

    # Display all books
    books = Book.all
    @view.display_list(books)

    # Ask for which book by ID
    id = @view.ask_for("id").to_i
    # Find the book
    book = Book.find(id)

    # Detroy the book
    book.destroy
  end

  def mark_as_rent
    # Fetch ALL the books from Active Record
    # Display all books
    books = Book.all
    @view.display_list(books)

    # Ask for which book by ID
    id = @view.ask_for("id").to_i

    # Find the book
    book = Book.find(id)

    # Mark as rent
    ## shorter version: book.rent = !book.rent
    if book.rent # => true
      book.rent = false
    else
      book.rent = true
    end

    # Save
    book.save

  end


end
