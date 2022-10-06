Rails.application.routes.draw do
  # get 'order/create'
  # get 'order/update'
  # get 'order/delete'
  resources :health, only: :index
  resources :trucks, only: :show do
    resources :order, only: %i[create update delete]
  end
end
