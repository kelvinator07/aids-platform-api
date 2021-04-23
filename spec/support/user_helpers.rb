require 'faker'
require 'factory_bot_rails'

module UserHelpers

  def create_user
    FactoryBot.create(:user, 
            firstname: Faker::Name.name, 
            lastname: Faker::Internet.email,
            email: Faker::Internet.email, 
			      password: Faker::Internet.password
		)
  end

	def build_user
    FactoryBot.build(:user, 
            firstname: Faker::Name.name, 
            lastname: Faker::Name.name,
            email: Faker::Internet.email, 
            password: Faker::Internet.password
		)
  end

end