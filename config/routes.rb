Rails.application.routes.draw do
  devise_scope :user do
    get '/sign-in' => "devise/sessions#new", :as => :login
  end
  get "list", to:"map#list"
  devise_for :users
  root to: 'map#index'
  post "/", to: 'map#explore'
  post "/add_place", to: 'place#add_geoloc'
  post "/find_address", to: 'place#find_with_address'
  #root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
