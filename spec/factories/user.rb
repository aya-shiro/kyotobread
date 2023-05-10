FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 10) }
    email { Faker::Internet.email }
    user_info { Faker::Lorem.characters(number: 20) }
    password { 'password' }
    password_confirmation { 'password' }

    after(:build) do |user|
      user.user_image.attach(io: File.open('spec/images/no-user-image.jpg'), filename: 'profile_image.jpeg', content_type: 'application/xlsx')
    end
  end
end
