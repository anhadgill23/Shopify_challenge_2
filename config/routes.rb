Rails.application.routes.draw do
  resources :shops do
    resources :products
  end
  resources :line_orders, only: [:create]
  resources :orders, only: [:index, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
