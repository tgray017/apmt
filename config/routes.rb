Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :statuses
  resources :tickets
  resources :users do
    resources :tickets
  end
  resources :comments
  resources :replies

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'signup', to: 'users#new'
  get 'logout', to: 'sessions#destroy'
  root 'welcome#home'

  get 'auth/google_oauth2/callback', to: 'sessions#create'

end
