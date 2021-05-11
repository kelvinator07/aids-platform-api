FactoryBot.define do
    factory :user do
        # firstname { Faker::Name.name }
        # lastname { Faker::Name.name }
        # password { Faker::Internet.password }
        # email { Faker::Internet.email }
        # picture { Rack::Test::UploadedFile.new('kelvin', 'image/png') }
    end
  end

FactoryBot.define do
  factory :image do
    name 'My Cat'
    creator 'Nisse'
    price 10
    print_size '200x200'
    file { File.new("#{Rails.root}/spec/images/my_cat.png") }
  end
end
