Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :statuses
  resources :tickets
  resources :users
  resources :sessions
  root 'welcome#home'
end
