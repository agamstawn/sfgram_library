class Author < ApplicationRecord
    self.primary_key = :id
    
    has_many :books, :foreign_key => "author_id"
    # has_many :books, :foreign_key => "author"
    accepts_nested_attributes_for :books

    validates :gender, presence: true
    validates :name, presence:true, uniqueness: true
end
