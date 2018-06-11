Rails.application.routes.draw do
  mount ForestLiana::Engine => "/forest"
  devise_scope :user do
    get "/sign-in" => "devise/sessions#new", :as => :login
  end
  get "admin", to: "pages#admin", as: "admin"

  resources :place, only: [:destroy]
  get "list", to: "map#list"
  get "created", to: "pages#created"
  get "edit", to: "map#edit"
  get "test", to: "map#test"

  resources :place
  get "list", to: "pages#list"
  get "created", to: "pages#created"
  get "test", to: "pages#test"

<<<<<<< HEAD
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
=======
  devise_for :users
>>>>>>> 30784ba284d6b3d4e585efbdc7ab881562345d06
  root to: "map#index"
  post "/", to: "map#explore"
  post "/add_place", to: "place#add_geoloc"
  post "/find_address", to: "place#find_with_address"
  post "/put_address", to: "place#put_address"

  #root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
