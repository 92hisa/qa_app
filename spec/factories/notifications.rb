FactoryBot.define do
  factory :notification do
    association :post
    association :answer
    association :comment
    association :visitor
    association :visited
  end
end
