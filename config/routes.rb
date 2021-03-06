Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resource :profile do
        resources :posts
      end
      resources :posts do
        resources :likes
      end
      resources :relationships do
        resource :type 
      end
    end
  end
end
