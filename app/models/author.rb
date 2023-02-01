class Author < ApplicationRecord
    self.primary_key = :id

    validates :gender, presence: true
    validates :name, presence:true, uniqueness: true
end
