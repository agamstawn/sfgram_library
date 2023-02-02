class Book < ApplicationRecord
    self.primary_key = :id

    validates :title, :year, presence: true

    ransacker :similar_books do
        Arel.sql("array_to_string(similar_books, ',')")
    end

end