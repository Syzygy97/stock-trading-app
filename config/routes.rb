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
  
  get 'stocks/index'
  get 'stocks/show'
  get 'stocks/new'
  get 'stocks/create'
  get 'stocks/edit'
  get 'stocks/update'
  get 'stocks/destroy'

  get 'portfolios/index'
  get 'portfolios/show'
  get 'portfolios/new'
  get 'portfolios/create'
  get 'portfolios/edit'
  get 'portfolios/update'
  get 'portfolios/destroy'

  get 'histories/index'
  get 'histories/show'
  get 'histories/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
end
