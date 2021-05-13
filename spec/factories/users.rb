FactoryBot.define do
  factory :user, aliases: [:visitor, :visited] do
    sequence(:name) { |n| "foobar#{n}" }
    sequence(:email) { |n| "foobar#{n}@foobar.com" }
    password { "password1" }
    password_confirmation { "password1" }
    gender { "man" }
    birth_date { 2000 - 0o1 - 0o1 }
  end
end
