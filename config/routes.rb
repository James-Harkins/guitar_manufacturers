Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/new', to: 'manufacturers#new'
  post '/manufacturers', to: 'manufacturers#create'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/manufacturers/:id/edit', to: 'manufacturers#edit'
  patch '/manufacturers/:id', to: 'manufacturers#update'
  delete '/manufacturers/:id', to: 'manufacturers#destroy'

  get '/guitars', to: 'guitars#index'
  get '/guitars/:id/edit', to: 'guitars#edit'
  patch '/guitars/:id', to: 'guitars#update'
  get '/guitars/:id', to: 'guitars#show'

  get '/manufacturers/:id/guitars', to: 'manufacturer_guitars#index'
  get '/manufacturers/:id/guitars/new', to: 'manufacturer_guitars#new'
  post '/manufacturers/:id/guitars', to: 'manufacturer_guitars#create'
end
