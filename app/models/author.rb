class Author < ApplicationRecord
    self.primary_key = :id
    
    # uncomment this relation after migration success
    # has_many :books, :foreign_key => "author_id"
    # accepts_nested_attributes_for :books

    # uncomment this validation after migration success
    # validates :gender, presence: true
    # validates :name, presence:true, uniqueness: true
end
