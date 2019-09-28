Rails.application.routes.draw do
  root "pages#home"
  get '/about', to: "pages#about"
  resources :articles
  get 'signup', to: "users#new"
  resources :users, except: [:new] #all routes the new user routes as signup
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
