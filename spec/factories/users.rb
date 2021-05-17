FactoryBot.define do
  factory :user, aliases: [:visitor, :visited] do
    sequence(:name) { |n| "foobar#{n}" }
    sequence(:email) { |n| "foobar#{n}@foobar.com" }
    password { "password1" }
    password_confirmation { "password1" }
    gender { "man" }
    birth_date { "2000-01-01" }
    is_deleted { "false" }
  end

  factory :other_user do
    sequence(:name) { "other_user" }
    sequence(:email) { "other_user@foobar.com" }
    password { "password1" }
    password_confirmation { "password1" }
    gender { "woman" }
    birth_date { "2010-01-01" }
    is_deleted { "false" }
  end
end
