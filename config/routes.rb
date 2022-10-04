Rails.application.routes.draw do
  get 'order_products/create'
  resources :trucks, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :order_products, only: :create
end
