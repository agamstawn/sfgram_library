FactoryBot.define do
    factory :author do
      name { Faker::Name.name_with_middle}
      gender {'m'}
      born { Faker::Date.backward(days: 23)}
      died { Faker::Date.forward(days: 23) }
    end
  end
  