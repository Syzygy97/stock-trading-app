Rails.application.routes.draw do
  # get 'dashboard/index'
  # get 'trader_stocks/index'
  # get 'trader_stocks/show'
  # get 'trader_stocks/new'
  # get 'trader_stocks/create'
  # get 'trader_stocks/edit'
  # get 'trader_stocks/update'
  # get 'trader_stocks/destroy'
  # get 'orders/index'
  # get 'orders/new'
  # get 'orders/create'
  # get 'orders/edit'
  # get 'orders/update'
  # get 'orders/destroy'
  
  devise_for :users

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
        get 'dashboard/index', as: :authenticated_root
      end
    end
  end
  
  get 'homes/index'
  
  # get 'stocks', to: "stocks#index", as: "stocks"
  # get 'stocks/:id', to: "stocks#show", as: "stock"
  # get 'stock/new', to: "stocks#new", as: "new_stock"
  # post 'stocks/create', to: "stocks#create"
  # get 'stocks/:id/edit', to: "stocks#edit", as: "edit_stock"
  # patch 'stocks/update', to: "stocks#update"
  # delete 'stocks/:id', to: "stocks#destroy" 

  # get 'portfolios', to: "portfolios#index", as: "portfolios"
  # get 'portfolios/:id', to: "portfolios#show", as: "portfolio"
  # get 'portfolio/new', to: "portfolios#new", as: "new_portfolio"
  # post 'portfolios', to: "portfolios#create"
  # get 'portfolios/:id/edit', to: "portfolios#edit", as: "edit_portfolio"
  # patch 'portfolios/:id', to: "portfolios#update"
  # delete 'portfolios/:id', to: "portfolios#destroy"

  # get 'histories', to: "histories#index", as: "histories"
  # get 'histories/:id', to: "histories#show", as: "history"
  # delete 'histories/:id', to: "histories#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
end
