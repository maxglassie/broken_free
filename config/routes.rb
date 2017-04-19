Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'sessions/create'
  get 'sessions/destroy'

  resource :countries, only: [:show]

  root to: 'home#index', as: 'root'
  resource :home, only: [:show]
  root to: "home#show"
end
