Rails.application.routes.draw do
  devise_for :users, controllers: {seessions: 'users/sessions', registrations: 'users/registrations'}
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'accounts', to: 'users/registrations#new_account'
    post 'accounts', to: 'users/registrations#create_account'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "items#index"
  resources :items, only: [:index]
  get 'items/sell'
  resources :users, only: [:show, :edit, :update]
  resources :items do
    collection do #最終的にmemberに切り替える
      get :confirmation

      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :homes, only: [:new]
  resources :credit, only: [:new, :show, :destroy] do
    collection do
      post :pay
      get :buy
    end
  end
end