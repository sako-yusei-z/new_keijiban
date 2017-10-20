Rails.application.routes.draw do
  devise_for :users

  root 'homes#index'
  get '/users/sign_out' => 'devise/sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: :index do
    resources :posts do
      resources :comments, only: :create do
        resources :replies, only: :create
      end
    end
  end
end
