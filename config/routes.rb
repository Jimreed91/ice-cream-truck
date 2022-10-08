Rails.application.routes.draw do
  # get 'order/create'
  # get 'order/update'
  # get 'order/delete'
  resources :health, only: :index
  resources :trucks, only: :show do
    resources :orders, except: :index
  end
end
