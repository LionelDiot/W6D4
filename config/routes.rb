Rails.application.routes.draw do
  resources :emails
  post '/generate', to: 'emails#generate', as: 'generate_email' 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "emails#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
