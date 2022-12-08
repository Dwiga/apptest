FactoryBot.define do
  factory :book_wikipedium do
    association :book
    url { "https://en.wikipedia.org/wiki/The_Time_Machine" }
    found {true}
    year {-1}
  end
end
