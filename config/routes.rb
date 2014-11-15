Bookshelf::Application.routes.draw do
  root 'feeds#index'

  get '/auth/github/callback', to: 'sessions#create'
  resource :session, only: [:new]

  resources :feeds, only: [:new, :create, :show] do
    resources :entries, only: [:show]
  end
end
