module BooksHelper
    def get_book_name(similar_books)
        similar_books == [] ? "-" : similar_books.join(", ") 
    end
end
