FactoryBot.define do
  factory :post do
    title { "title_test" }
    content { "content_test" }
    status { 0 }
    association :user
    association :category
  end
end
