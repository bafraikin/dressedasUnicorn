Rails.application.routes.draw do
  mount ForestLiana::Engine => "/forest"
  devise_scope :user do
    get "/sign-in" => "devise/sessions#new", :as => :login
  end
  get "/pages/AdminRole", to: "pages#changeAdminRole"
  post "/pages/AdminRole", to: "pages#changeAdminRole"
  get "admin", to: "pages#admin"
  resources :place, only: [:destroy, :update]
  post "update", to: "pages#edit"
  get "favoris", to: "pages#favoris"
  get "created", to: "pages#created"
  get "edit", to: "pages#edit"
  put "edit", to: "pages#edit"
  get "test", to: "pages#test"
  get "contact", to: "pages#contact"

  devise_for :users
  root to: "map#index"
  post "/", to: "map#explore"
  post "/add_place", to: "place#add_geoloc"
  post "/find_address", to: "place#find_with_address"
  post "/put_address", to: "place#put_address"
  post "/imhere", to: "place#add_imhere"
  post "/place/favplaces", to: "place#favplaces"
  get  "/category", to: "place#category"
  post "/sort_by_tag", to: "place#list_by_tag"

  #devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}

  #root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #resources :contacts, only: [:new, :create]
  
end
