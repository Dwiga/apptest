FactoryBot.define do
    factory :wikipedium do
        association :author
        url { "http://wikipedia.com" }
        found { true }
    end
end