Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }
  
  get 'homes/index'
  
  # root "homes#index"
  root to: "users#index"
  
  get 'dashboard', to: "users#index", as: "dashboard"
  patch 'users/:id', to: "users#update", as: "update_user"

  resources :trader_stocks
  resources :orders
  resources :stocks
  # devise_for :users, path: 'users', controllers: {
  #     sessions: 'users/sessions',
  #     registrations: 'users/registrations'
  #   }

  devise_scope :user do
    authenticated :user do
      namespace :users do
        get 'dashboard', to: "users#index", as: :authenticated_root
      end
    end
  end
  
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  devise_scope :admin do
    authenticated :admin do
      namespace :admins do
        get 'users', to: "admin_pages#index", as: :authenticated_root
        put 'admin_pages/approved_user', to: "admin_pages#approve_user"
        get 'add_user', to: 'admin_pages#add_user'
        post 'create_user', to: 'admin_pages#create_user'
        get 'users/:id/edit' => 'admin_pages#edit_user', as: 'edit_user'
        patch 'users/:id/edit' => 'admin_pages#update_user', as: 'update_user'
        delete 'users/:id', to: 'admin_pages#destroy', as: 'delete_user'
        get 'users/:id/view' => 'admin_pages#show_user', as: 'show_user'
      end
    end
  end
end