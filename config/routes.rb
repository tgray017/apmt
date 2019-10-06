Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :statuses
  resources :tickets
  resources :users do
    resources :tickets
  end
  resources :comments
  resources :replies

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  root 'welcome#home'

end
