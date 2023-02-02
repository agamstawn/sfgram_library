FactoryBot.define do
  factory :book do
    title {'Test Title'}
    author_name { Faker::Name.name_with_middle}
    year {'2024'}
    pages { 666 }
  end
end
