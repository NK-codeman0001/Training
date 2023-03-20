Rails.application.routes.draw do
  get 'pages/about_us'
  get 'pages/contact_us'
  get 'pages/privacy_policy'
  get 'pages/terms_and_conditions'
  get '/home' => 'home#index'
end
