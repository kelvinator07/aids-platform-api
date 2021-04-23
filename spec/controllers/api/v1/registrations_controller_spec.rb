require 'rails_helper'

describe RegistrationsController, type: :request do

  let (:user) { build_user }
  let (:existing_user) { create_user }
  let (:signup_url) { '/api/v1/signup' }

  context 'When creating a new user' do
    before do
      post signup_url, params: {
        # registration: {
            firstname: user.firstname,
            lastname: user.lastname,
            email: user.email,
            password: user.password,
            picture: user.picture
        # }
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      # expect(json).to eq(10)
    end

    it 'returns a token' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns the user email' do
      expect(json['data']).to have_attribute(:email).with_value(user.email)
    end
  end

  context 'When an email already exists' do
    before do
      post signup_url, params: {
        # registration: {
            firstname: existing_user.firstname,
			      lastname: existing_user.lastname,
            email: existing_user.email,
            password: existing_user.password,
            picture: existing_user.picture
        # }
      }
    end

    it 'returns 400' do
      expect(response.status).to eq(400)
    end
  end

end