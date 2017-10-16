Rails.application.routes.draw do
  devise_for :users

  root 'homes#index'
  get '/users/sign_out' => 'devise/sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :posts do
      resources :comments do
        resources :replies
      end
    end
  end
end
