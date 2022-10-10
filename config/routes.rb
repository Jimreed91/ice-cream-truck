Rails.application.routes.draw do
  # get 'order/create'
  # get 'order/update'
  # get 'order/delete'
  resources :products, except: :delete
  resources :trucks, only: %i[show index] do
    resources :orders, except: :index
  end
end
