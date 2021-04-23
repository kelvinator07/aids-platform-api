FactoryBot.define do
    factory :user do
        firstname { Faker::Name.name }
        lastname { Faker::Name.name }
        password { Faker::Internet.password }
        email { Faker::Internet.email }
        # picture { 'http://lie' }
    end
  end