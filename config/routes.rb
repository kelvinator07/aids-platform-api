Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  namespace :api, defaults: { format: :json } do
    namespace :v1, defaults: { format: :json } do
      resources :users, only: %w[show]
      get 'requests/user/:user_id', to: "requests#userrequests"
      get 'messages/:response_id', to: "messages#response_messages"
      put 'requests/republish/:request_id', to: "requests#republish"
      resources :requests
      resources :responses
      resources :messages

    end
  end

  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'api/v1/login',
      sign_out: 'api/v1/logout',
      registration: 'api/v1/signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
