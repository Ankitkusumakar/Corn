Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # devise_for :users
  root "user#index"
  resources :posts do
      member do
        put 'like_post'
      end
      collection do
        get :services_posts
      end 
  end
  # post "/posts/new" => "post#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end