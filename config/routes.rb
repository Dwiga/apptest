Rails.application.routes.draw do
  root "books#index"
  get "author/:id", :to => "authors#view"
  get "book/:id", :to => "books#view"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
