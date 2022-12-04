Rails.application.routes.draw do
  root "books#index"
  resources :authors do
    resources :wikipedia
  end

  get "book/:id", :to => "books#view"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
