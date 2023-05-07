FactoryBot.define do
  factory :bread do
    bread_name { Faker::Lorem.characters(number:5) }
    introduce { Faker::Lorem.characters(number:20) }
    # drink { Faker::Lorem.characters(number:20) }
    taste { Faker::Boolean.boolean }

  end
end