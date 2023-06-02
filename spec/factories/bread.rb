FactoryBot.define do

  factory :drink do
    drink_name { "コーヒー" }
  end

  factory :bread do
    bread_name { Faker::Lorem.characters(number:5) }
    introduce { Faker::Lorem.characters(number:20) }
    taste { Faker::Boolean.boolean }

    drink { association :drink, strategy: :build }

    after(:build) do |bread|
      bread.bread_image.attach(io: File.open('spec/images/no-user-image.jpg'), filename: 'profile_image.jpeg', content_type: 'application/xlsx')
    end
  end
  
  factory :comment do 
    comment { Faker::Lorem.characters(number:20) }
  end
  
  factory :feedback do
    opinion { Faker::Lorem.characters(number:40) }
  end
end