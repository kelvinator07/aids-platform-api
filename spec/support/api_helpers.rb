module ApiHelpers

	def json
		JSON.parse(response.body)
	end

	def login_with_api(user)
		post '/api/v1/login', params: {
			user: {
				firstname: user.firstname,
				lastname: user.lastname,
				email: user.email,
				password: user.password,
				picture: user.picture
			}
      }
	end

end