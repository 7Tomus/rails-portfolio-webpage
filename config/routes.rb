Rails.application.routes.draw do
  resources :projects do
    resources :posts
  end
  root "projects#index"
  get '/about', to: 'pages#about'
end
