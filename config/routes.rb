Rails.application.routes.draw do
  mount ForestLiana::Engine => "/forest"
  devise_scope :user do
    get "/sign-in" => "devise/sessions#new", :as => :login
  end
  resources :place
  get "list", to: "map#list"
  get "created", to: "map#created"
  get "test", to: "map#test"
  devise_for :users
  root to: "map#index"
  post "/", to: "map#explore"
  post "/add_place", to: "place#add_geoloc"
  post "/find_address", to: "place#find_with_address"
  post "/put_address", to: "place#put_address"
  #root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
