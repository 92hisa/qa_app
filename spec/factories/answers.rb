FactoryBot.define do
  factory :answer do
    episode { "episode_test" }
    content { "content_test" }
    association :user
    association :post
  end
end
