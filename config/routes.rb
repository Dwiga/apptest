Rails.application.routes.draw do
  root "books#index"

  resources :authors do
    resources :wikipedia
    resources :books
  end

  resources :books do
    resources :book_wikipedia
    resources :good_reads
    resources :gutenbergs
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
