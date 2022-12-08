FactoryBot.define do
  factory :author do
    bio { Faker::Quote.matz }
    name { Faker::Book.author }
    countries { "[1]" }
    gender { "m" }
    n_books { 90 }
    summary { Faker::Quote.matz }
    born { 90.years.ago }
    died { 5.years.ago }
  end
end
