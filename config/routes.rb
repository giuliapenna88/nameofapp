Rails.application.routes.draw do

	devise_for :users
  resources :products do
    resources :comments
  end
  resources :users
  resources :orders, only: [:index, :show, :create, :destroy]

  get 'static_pages/about', to: 'static_pages#about'

  get 'static_pages/contact', to: 'static_pages#contact'

  get 'static_pages/index', to: 'static_pages#index'

  post 'static_pages/thank_you', to: 'static_pages#thank_you'

  root 'static_pages#homepage'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
