Rails.application.routes.draw do

  # get 'order/create'
  # get 'order/update'
  # get 'order/delete'
  resources :trucks, only: :show do
    resources :order, only: [:create, :update, :delete]
  end
end
