FactoryBot.define do
  factory :book do
    association :author
    content_name { '35.txt.utf-8' }
    isbn { "0375759239" }
    original_title { Faker::Book.title }
    year { 10.years.ago }
    language_code { "eng" }
    category { "Sound" }
    plot { Faker::Markdown.emphasis }
    copyright { "Public domain in the USA." }
    title { Faker::Book.title }
    average_rating { 3.5 }
    rating_count { 1000 }
    description { Faker::Markdown.emphasis }
    loc_class { "PR: Language and Literatures: English literature" }
    pages { 1001 }
    language { "English" }
    isbn13 { "123455" }
    countries { "[1,2]" }
    release_date { 100.years.ago }
    cover { "https://images.gr-assets.com/books/1320391644l/8909.jpg" }
    summary { Faker::Markdown.emphasis }
    content_cleaned { 1 }
    content_available { 1 }
    n_authors { 1 }
    author_name { Faker::Book.author }
  end
end
