class Book < ApplicationRecord
    self.primary_key = :id

    validates :year, presence: true
    validates :title, presence: true, uniqueness: true
    
    ransacker :similar_books do
        Arel.sql("array_to_string(similar_books, ',')")
    end

end