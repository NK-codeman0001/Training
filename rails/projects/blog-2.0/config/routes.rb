Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "blogs#index"
  post "/blogs", to:"blogs#create"
  get "/blogs/new", to:"blogs#new"
  get "/blogs/:id", to:"blogs#show", as: :show
  delete "/blogs/:id", to: "blogs#destroy"
  get "/blogs/:id/edit", to: "blogs#edit", as: :blog
  patch "/blogs/:id/edit", to: "blogs#update"
  patch "/blogs/:id", to: "blogs#archive"
  
  #This will match any GET request with an unmatched path
  # get "*path", to: "blogs#index"
  
end
