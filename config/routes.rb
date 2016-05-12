Rails.application.routes.draw do
  namespace :admin do
    resources :checkins
resources :events
resources :invitations
resources :profiles
resources :users
resources :identities

    root to: "checkins#index"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'auth/:provider/callback', to: 'sessions#create'
  post 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'login' => 'identities#login', as: 'login'
  get 'signup' => 'identities#new', as: 'signup'
  root 'sessions#new'
  resources :identities
end
