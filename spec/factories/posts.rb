FactoryBot.define do
  factory :post do
    title { "title_test" }
    content { "content_test" }
    status { "open" }
    association :user
    association :category
  end
end
