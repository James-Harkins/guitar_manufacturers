Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/guitars', to: 'guitars#index'
  get 'guitars/:id', to: 'guitars#show'
  get 'manufacturers/:id/guitars', to: 'manufacturer_guitars#index'
end
