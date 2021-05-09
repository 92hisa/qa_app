FactoryBot.define do
  factory :user, aliases: [:visitor, :visited] do
    sequence(:name) { |n| "foobar#{n}" }
    sequence(:email) { |n| "foobar#{n}@foobar.com" }
    password { "password" }
    password_confirmation { "password" }
    gender { "man" }
    birth_date { 2000-01-01 }
  end
end
