Rails.application.routes.draw do
  resources :shops do
    resources :products do
    end
  end
  resources :line_items, only: [:index, :create]
  resources :orders, only: [:index, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
