Rails.application.routes.draw do
  root "books#index"

  resources :authors do
    resources :wikipedia
    resources :books
  end

  resources :books do
    resources :images
    resources :book_wikipedia
    resources :good_reads
    resources :gutenbergs
    resources :another_books do
      resources :similar_books
    end
    resources :tags do
      resources :book_tags
    end
    resources :book_tags
    resources :similar_books
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
