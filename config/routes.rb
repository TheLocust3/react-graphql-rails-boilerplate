Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end

  post '/graphql', to: 'graphql#execute'

  devise_for :users, skip: [ :sessions, :registrations, :passwords ]

  root to: 'root#index'

  devise_scope :user do
    post '/api/users/sign_in'  => 'api/users/sessions#create', as: :new_user_session
    delete '/api/users/sign_out' => 'api/users/sessions#destroy', as: :destroy_user_session

    post '/api/users' => 'api/users/registrations#create'
    patch '/api/users' => 'api/users/registrations#update'

    post '/api/users/password' => 'api/users/passwords#create'
    patch '/api/users/password' => 'api/users/passwords#update', as: :user_password
    get '/reset_password' => 'root#index', as: :edit_user_password
  end

  get '*path', to: 'root#index'
end
