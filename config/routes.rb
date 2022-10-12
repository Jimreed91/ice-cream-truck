Rails.application.routes.draw do
  # get 'order/create'
  # get 'order/update'
  # get 'order/delete'
  put 'orders/:id', to: 'orders#update'
  resources :products, except: :delete
  resources :trucks, only: %i[show index] do
    resources :orders, only: %i[create]
  end
end
