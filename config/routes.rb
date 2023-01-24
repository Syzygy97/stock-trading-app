Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  
  get 'homes/index'
  
  # root "homes#index"
  root to: "users#index"
  
  get 'dashboard', to: "users#index", as: "dashboard"
  patch 'users/:id', to: "users#update", as: "update_user"

  resources :trader_stocks
  resources :orders
  resources :stocks
  # devise_for :users, path: 'users', controllers: {
    #   sessions: 'users/sessions',
    #   registrations: 'users/registrations'
    # }

  # devise_scope :user do
  #   authenticated :user do
  #     namespace :users do
  #       get 'portfolios/index', as: :authenticated_root
  #       get 'portfolios', to: "portfolios#index", as: "portfolios"
  #       get 'portfolios/:id', to: "portfolios#show", as: "portfolio"
  #       get 'portfolio/new', to: "portfolios#new", as: "new_portfolio"
  #       post 'portfolios', to: "portfolios#create"
  #       get 'portfolios/:id/edit', to: "portfolios#edit", as: "edit_portfolio"
  #       patch 'portfolios/:id', to: "portfolios#update", as: "update_portfolio"
  #       delete 'portfolios/:id', to: "portfolios#destroy"
  
  #       get 'stocks', to: "stocks#index", as: "stocks"
  #       get 'stocks/:id', to: "stocks#show", as: "stock"
  #       get 'stock/new', to: "stocks#new", as: "new_stock"
  #       post 'stocks/create', to: "stocks#create"
  #       get 'stocks/:id/edit', to: "stocks#edit", as: "edit_stock"
  #       patch 'stocks/update', to: "stocks#update"
  #       delete 'stocks/:id', to: "stocks#destroy"
  
  #       get 'histories', to: "histories#index", as: "histories"
  #       get 'histories/:id', to: "histories#show", as: "history"
  #       delete 'histories/:id', to: "histories#destroy"
  #     end
  #   end
  # end
  
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