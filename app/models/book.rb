class Book < ApplicationRecord
    self.primary_key = :id

    validates :title, :year, presence: true

end