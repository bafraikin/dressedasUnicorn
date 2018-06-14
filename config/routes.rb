Rails.application.routes.draw do
  mount ForestLiana::Engine => "/forest"
  devise_scope :user do
    get "/sign-in" => "devise/sessions#new", :as => :login
  end
  resources :pages
  get "admin", to: "pages#admin", as: "admin"
  get "/pages/AdminRole", to: "pages#changeAdminRole"
  post "/pages/AdminRole", to: "pages#changeAdminRole"

  resources :place, only: [:destroy, :update]
  post "update", to: "pages#edit"
  get "favoris", to: "pages#favoris"
  get "created", to: "pages#created"
  get "category", to: "pages#category"
  get "edit", to: "pages#edit"
  put "edit", to: "pages#edit"
  get "test", to: "pages#test"

  devise_for :users
  root to: "map#index"
  post "/", to: "map#explore"
  post "/add_place", to: "place#add_geoloc"
  post "/find_address", to: "place#find_with_address"
  post "/put_address", to: "place#put_address"
  post "/imhere", to: "place#add_imhere"
  post "/place/favplaces", to: "place#favplaces"
  post "/sort_by_tag", to: "pages#list_by_tag"

  #devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}

  #root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
