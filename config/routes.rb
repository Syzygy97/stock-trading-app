Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  devise_scope :user do
    authenticated :user do
      namespace :users do
        get 'dashboard/index', as: :authenticated_root
      end
    end
  end

  devise_scope :admin do
    authenticated :admin do
      namespace :admins do
        get 'dashboard/index', as: :authenticated_root
      end
    end
  end
  
  get 'homes/index'
  
  get 'stocks', to: "stocks#index", as: "stocks"
  get 'stocks/:id', to: "stocks#show", as: "stock"
  get 'stock/new', to: "stocks#new", as: "new_stock"
  post 'stocks/create', to: "stocks#create"
  get 'stocks/:id/edit', to: "stocks#edit", as: "edit_stock"
  patch 'stocks/update', to: "stocks#update"
  delete 'stocks/:id', to: "stocks#destroy" 

  get 'portfolios', to: "portfolios#index", as: "portfolios"
  get 'portfolios/:id', to: "portfolios#show", as: "portfolio"
  get 'portfolio/new', to: "portfolios#new", as: "new_portfolio"
  post 'portfolios', to: "portfolios#create"
  get 'portfolios/:id/edit', to: "portfolios#edit", as: "edit_portfolio"
  patch 'portfolios/:id', to: "portfolios#update"
  delete 'portfolios/:id', to: "portfolios#destroy"

  get 'histories', to: "histories#index", as: "histories"
  get 'histories/:id', to: "histories#show", as: "history"
  delete 'histories/:id', to: "histories#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
end
