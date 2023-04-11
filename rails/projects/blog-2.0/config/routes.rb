Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "blogs#index"
  get "/new", to:"blogs#new"
  get "/:id", to:"blogs#show"
  post "/new", to:"blogs#create"
  
end
