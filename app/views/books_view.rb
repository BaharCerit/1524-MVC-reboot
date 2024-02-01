class BooksView
  def display_list(books)
    books.each do |book|
      puts " #{book.id}, #{book.title}: #{book.category}, #{book.price}, #{book.author}, #{book.rent}"
    end
  end

  def ask_for(thing)
    puts "what is your books #{thing}"
    gets.chomp
  end
end
