Bookshelf::Application.routes.draw do
  root 'application#index'

  get '/auth/github/callback', to: 'sessions#create'

  resources :feeds, only: [:new, :create]
end
