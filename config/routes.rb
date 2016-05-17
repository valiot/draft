Rails.application.routes.draw do
  namespace :admin do
    resources :attendees
    resources :events
    resources :identities
    resources :invitations
    resources :profiles
    resources :teams
    resources :users

    root to: 'attendees#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'privacy-policy', to: 'pages#privacy'
  get 'auth/:provider/callback', to: 'sessions#create'
  post 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'login', to: 'identities#login', as: 'login'
  get 'signup', to: 'identities#new', as: 'signup'
  get 'user/edit', to: 'users#edit', as: 'edit_user'
  patch 'user/', to: 'users#update', as: 'user'
  root 'sessions#new'
  resources :identities
end
