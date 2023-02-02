FactoryBot.define do
  factory :book do
    title {'Test Title'}
    author_name { Faker::Name.name_with_middle}
    year {'2024'}
    pages { 666 }
    author_id { 1 }
    # author { 1 }
    # after(:build) do |book|
    #   book.authors << build(:author, book: book)
    # end
  end
end
