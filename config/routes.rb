Rails.application.routes.draw do

  root "posts#index"

  resources :posts do
    resources :comments
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
