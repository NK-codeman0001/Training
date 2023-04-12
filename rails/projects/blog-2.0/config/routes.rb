Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "blogs#index"
  get "/new", to:"blogs#new"
  get "/:id", to:"blogs#show"
  get "/edit/:id", to: "blogs#edit"
  patch "/:id", to: "blogs#update"
  post "/new", to:"blogs#create"
  delete "/:id", to: "blogs#destroy"
  
end
