Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
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
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
end
