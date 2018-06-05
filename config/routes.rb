Rails.application.routes.draw do
  get 'place/add_geoloc'
  devise_for :users
  root to: 'map#index'
  post "/add_place", to: 'place#add_geoloc'
  #root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
