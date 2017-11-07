Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root 'homes#index'
  get '/users/sign_out' => 'devise/sessions#destroy'

  resources :posts do
    resources :comments, only: :create do
      resources :replies, only: :create
    end
  end
end
