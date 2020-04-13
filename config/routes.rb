Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resources :items, only: [:index, :show, :new, :create, :edit, :destroy] do
    collection do
      get 'confirm'
    end
  end

  resources :users, only: [:show] do
    collection do
      get 'payment'
      get 'signout'
    end
  end

  root to: 'items#index'

end