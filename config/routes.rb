Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :posts do
      resources :comments
    end
  end
  root "projects#index"
  get '/about', to: 'pages#about'
end
