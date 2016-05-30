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
  get 'user/invitations', to: 'users#invitations', as: 'invitations'
  post 'user/invitations/accept/:id' => 'invitations#accept', as: 'accept_invitations'
  post 'user/invitations/reject/:id' => 'invitations#reject', as: 'reject_invitations'

  root 'sessions#new'

  resources :identities

  scope path: ':event', module: 'event', as: 'event' do
    root to: 'sessions#new', as: 'main'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    get 'checkin', to: 'attendees#new', as: 'checkin'
    post 'checkin', to: 'attendees#create', as: 'post_checkin'

    get 'auth/:provider/callback', to: 'sessions#create'
    post 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/:event')

    get 'login', to: 'identities#login', as: 'login'
    get 'signup', to: 'identities#new', as: 'signup'
    resources :identities
  end
end
