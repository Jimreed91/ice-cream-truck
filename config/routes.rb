Rails.application.routes.draw do
  # get 'order/create'
  # get 'order/update'
  # get 'order/delete'
  put 'orders/:id', to: 'orders#update'
  patch 'orders/:id/commit', to: 'orders#commit'
  resources :products, except: :delete
  resources :trucks, only: %i[show index] do
    resources :orders, only: %i[create]
  end
end
